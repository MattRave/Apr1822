//
//  ViewController.swift
//  Avatar
//
//  Created by Luat on 6/6/21.
//

import UIKit
let avartarUrl = URL(string: "https://last-airbender-api.herokuapp.com/api/v1/characters")!

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var layoutPrefButton: UIBarButtonItem!
    @IBAction func changeLayout(_ sender: Any) {
        isGrid = !isGrid
        layoutPrefButton.title = isGrid ? "Grid" : "List"
        changeLayout()
    }
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.frame = self.view.bounds
        spinner.backgroundColor = .white
        spinner.alpha = 0.5
        return spinner
    }()
    
    var isGrid = false
    var isFetching = false
    var apiManager: AvatarAPIManager?
    var model: [Character]? {
        didSet {
            preLoadImageCache()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            print("model count: \(model?.count ?? 0)")
        }
    }
    var isOnIPAD: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager = ConcreteAPIManager()
        configureCollectionView()
        
        /// Currently only fetching 1 page at a time
        DispatchQueue.global().async {
            self.getCharacters(from: 1, to: 1)
        }
        
        changeLayout()
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "AvatarCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "AvatarCell")
    }

    func changeLayout() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        let spacing = layout.minimumInteritemSpacing
        var cellPerRow: CGFloat = 1
        if isOnIPAD { cellPerRow *= 2 }
        if isGrid {
            layout.itemSize = CGSize(width: view.bounds.width/(cellPerRow * 2) - spacing, height: 200)
        } else {
            layout.itemSize = CGSize(width: view.bounds.width/cellPerRow - spacing, height: 200)
        }
        
    }
    
    /// DispatchGroup: Fetching multiple pages, reload UI only once
    func getCharacters(from: Int, to: Int) {
        addSpinnerView()
        self.model = []
        var tempModels: [Character] = []
        let group = DispatchGroup()
        for num in from...to {
            group.enter()
            getCharacters(at: num) { (downloadedModels) in
                tempModels += downloadedModels
                group.leave()
            }
        }
        group.wait()
        group.notify(queue: .main, work: DispatchWorkItem(block: {
            self.removeSpinnerView()
            self.model = tempModels
        }))
    }
    
    func getCharacters(at page: Int, completion: @escaping ([Character]) -> Void) {
        apiManager?.getModelsAt(page: page) { (data) in
            guard let data = data else { return }
            let chars = try? JSONDecoder().decode([Character].self, from: data)
            if let chars = chars {
                completion(chars)
            }
        }
    }
    
    /// Fetch the next page when user scroll down, show activity spinner/indicator
    func getNextCharactersPagination() {
        isFetching = true
        addSpinnerView()
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let nextPage = (self.model?.count ?? 0) / 20 + 1
            self.getCharacters(at: nextPage) { newChars in
                self.model? += newChars
                self.removeSpinnerView()
                self.isFetching = false
            }
        }
    }
    
    /// Fetch all images before the cell ask for it
    func preLoadImageCache() {
        guard let model = model else { return }
        for char in model {
            if let photoUrl = char.photoUrl {
                ImageCache.shared.loadImage(from: photoUrl, completionHandler: { _ in})
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell else { fatalError() }
        
        if let charModel = model?[indexPath.row] {
            cell.configure(model: charModel)
            ImageCache.shared.loadImage(from: charModel.photoUrl ?? "") { image in
                /// Hack: Only update the cell's image if the cell is visible (pre iOS 15)
                if let visibleCell = collectionView.cellForItem(at: indexPath) as? AvatarCell {
                    visibleCell.imageView.image = image
                }
            }
        }
        
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selecting row: \(indexPath.row) section: \(indexPath.section) \n \(model?[indexPath.row].affiliation ?? "")")
    }
    
/// Pagination logic: start a fetch when we scroll to the bottom of the table/collection view
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomScreenOffset = scrollView.contentSize.height - scrollView.bounds.height
        if scrollView.contentOffset.y > bottomScreenOffset {
            /// ScrollViewDidScroll is constantly called when user is scrolling
            /// If there's an ongoing fetch, don't fetch
            if isFetching == false {
                getNextCharactersPagination()
            }
        }
    }
    
}

extension ViewController {
    func addSpinnerView() {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
            self.view.addSubview(self.spinner)
        }
        
    }
    func removeSpinnerView() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
        }
    }
}
