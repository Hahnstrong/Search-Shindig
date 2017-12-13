//
//  ImageDisplayViewController.swift
//  Search Shindig
//
//  Created by Caleb Strong on 12/13/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import UIKit

class ImageDisplayViewController: UIViewController {

    // MARK: - Properties
    
    var flickrImage: FlickrImage?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var FlickrTitleLabel: UILabel!
    @IBOutlet weak var FlickrUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let flickrImage = flickrImage else { return }
        FlickrTitleLabel.text = flickrImage.title
        FlickrImageController.searchForImage(flickrImage: flickrImage) { (image) in
            DispatchQueue.main.async {
                self.FlickrUIImageView.image = image
            }
        }
    }
}
