//
//  ViewController.swift
//  16-collectionViews
//
//  Created by Rave Bizz on 5/9/22.
//

import UIKit

class ViewController: UIViewController {
    var name = "Name"
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = ViewController()
        let vc2 = ViewController()
        vc.name = self.name
        vc2.name = vc.name
        
        collectionView.register(CollectionViewCell.getNib(), forCellWithReuseIdentifier: CollectionViewCell.idenifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 128, height: 128)

}


}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.idenifier, for: indexPath) as? CollectionViewCell{
            cell.configure(with: UIImage(named: "image")!)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
