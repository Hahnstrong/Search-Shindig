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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
