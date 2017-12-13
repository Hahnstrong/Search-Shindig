//
//  SearchListViewController.swift
//  Search Shindig
//
//  Created by Caleb Strong on 12/13/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    

    // MARK: - IBOutlets
    
    @IBOutlet weak var flickrSearchBar: UISearchBar!
    @IBOutlet weak var flickrListTableView: UITableView!
    
    // Search Bar Function
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = flickrSearchBar.text, searchTerm != "" else { return }
        FlickrImageController.searchForPhotos(searchTerm: searchTerm) { (flickrImage) in
            DispatchQueue.main.async {
                self.flickrListTableView.reloadData()
            }
        }
        
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        flickrListTableView.dataSource = self
        flickrListTableView.delegate = self
        flickrSearchBar.delegate = self
    }

    // MARK: - Table View Data Source Functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FlickrImageController.flickrImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlickrImageCell") as? FlickrImageTableViewCell else { return UITableViewCell() }
        
        let flickrList = FlickrImageController.flickrImageList
        let flickrImage = flickrList[indexPath.row]
        
        cell.updateView(flickrImage: flickrImage)
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageDisplay" {
            if let imageDisplayVC = segue.destination as? ImageDisplayViewController {
                if let selectedRow = flickrListTableView.indexPathForSelectedRow?.row {
                    let flickrImage = FlickrImageController.flickrImageList[selectedRow]
                    imageDisplayVC.flickrImage = flickrImage
                }
            }
        }
    }
}

















