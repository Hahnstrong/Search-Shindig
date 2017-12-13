//
//  FlickrImage.swift
//  Search Shindig
//
//  Created by Caleb Strong on 12/13/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import Foundation

class FlickrImage {
    
    let title: String
    let photo: String
    
    private let titleKey = "title"
    private let photoKey = "photo"
    
    init?(dictionary: [String: Any]) {
        guard let title = dictionary[titleKey] as? String,
            let photo = dictionary[photoKey] as? String else { return nil }
        
        self.title = title
        self.photo = photo
    }
}
