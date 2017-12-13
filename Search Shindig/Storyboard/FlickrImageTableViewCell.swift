//
//  FlickrImageTableViewCell.swift
//  Search Shindig
//
//  Created by Caleb Strong on 12/13/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import UIKit

class FlickrImageTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var FlickrTitleLabel: UILabel!
    @IBOutlet weak var FlickrUIImageView: UIImageView!
    
    func updateView(flickrImage: FlickrImage) {
        FlickrImageController.searchForImage(flickrImage: flickrImage) { (image) in
            DispatchQueue.main.async {
                self.FlickrTitleLabel.text = flickrImage.title
                self.FlickrUIImageView.image = image
            }
        }
    }
}
