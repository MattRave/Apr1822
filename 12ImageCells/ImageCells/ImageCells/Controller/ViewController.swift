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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        getData()
    }

    func getData() {
        Webservice().getAlbums { albums in
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
        
        return cell
    }
    
    
}
