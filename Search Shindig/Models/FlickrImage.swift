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
    let farm: Int
    let id: String
    let server: String
    let secret: String
    
    private let titleKey = "title"
    private let farmKey = "farm"
    private let idKey = "id"
    private let serverKey = "server"
    private let secretKey = "secret"
    
    init?(dictionary: [String: Any]) {
        guard let title = dictionary[titleKey] as? String,
            let farm = dictionary[farmKey] as? Int,
            let id = dictionary[idKey] as? String,
            let server = dictionary[serverKey] as? String,
            let secret = dictionary[secretKey] as? String else { return nil }
        
        self.title = title
        self.farm = farm
        self.id = id
        self.server = server
        self.secret = secret
    }
}
