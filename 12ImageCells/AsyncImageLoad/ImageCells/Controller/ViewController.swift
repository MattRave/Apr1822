//
//  ViewController.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var albums: [Album] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "AlbumCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AlbumCell")
        tableView.dataSource = self
        getData()
    }

    func getData() {
        ImageCache().getAlbums { albums in
            self.albums = albums
            print(albums)
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as? AlbumCell) else {
            return UITableViewCell()
        }
        
        let album = albums[indexPath.row]
        cell.configure(album: album)
        loadAndCancelPreviousTask(imageStr: album.imageUrl, cell: cell)
        
        return cell
    }
    
    func loadAndCancelPreviousTask(imageStr: String, cell: AlbumCell) {
        if let image = ImageCache.shared.publicCache.object(forKey: imageStr.hiRes as NSString) {
            cell.albumImage.image = image
            return
        }
        let startedTaskKey = ImageCache.shared.getImage(imageStr: imageStr.hiRes) { image in
            DispatchQueue.main.async {
                cell.albumImage.image = image
            }
        }
        cell.onReuse = {
            if let startedTaskKey = startedTaskKey {
                ImageCache.shared.pendingTasks[startedTaskKey]?.cancel()
                ImageCache.shared.pendingTasks.removeValue(forKey: imageStr.hiRes)
            }
        }
    }
    
    
}

extension String {
    var hiRes: String {
        self.replacingOccurrences(of: "100x100", with: "600x600")
    }
}
