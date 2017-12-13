//
//  FlickrImageController.swift
//  Search Shindig
//
//  Created by Caleb Strong on 12/13/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import Foundation
import UIKit

class FlickrImageController {
    
    static var flickrImageList: [FlickrImage] = []
    
    static func searchForPhotos(searchTerm: String, completion: @escaping([FlickrImage]?) -> Void) {
        /*
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let methodQueryItem = URLQueryItem(name: "method", value: "flickr.photos.search")
        let apiQueryItem = URLQueryItem(name: "api_key", value: "\(apiKey)")
        let searchQueryItem = URLQueryItem(name: "tags", value: "\(searchTerm)")
        let queryAmount = URLQueryItem(name: "per_page", value: "25")
        components?.queryItems = [methodQueryItem, apiQueryItem, searchQueryItem, queryAmount]
         */
        let baseURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search"
        let apiKey = "&api_key=1dd17dde0fed7286935d83875fcc17dd"
        let searchString = "&tags=\(searchTerm)"
        let queryAmount = "&per_page=25"
        let jsonInfo = "&format=json&nojsoncallback=1"
        
        guard let requestURL = URL(string: baseURL + apiKey + searchString + queryAmount + jsonInfo) else { return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("There was an error when the dataTask function began: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8),
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let resultsDictionary = jsonDictionary["photos"] as? [String: Any],
                let results = resultsDictionary["photo"] as? [[String: Any]]
                else { completion(nil); return }
            print(responseDataString)
            
            let flickrs = results.flatMap {FlickrImage(dictionary: $0) }
            self.flickrImageList = flickrs
            completion(flickrs)
        }
        
        dataTask.resume()
    }
    
    static func searchForImage(flickrImage: FlickrImage, completion: @escaping(UIImage?) -> Void) {
        let farm = flickrImage.farm
        let server = flickrImage.server
        let id = flickrImage.id
        let secret = flickrImage.secret
        guard let baseURL = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg") else { return }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data,
                let image = UIImage(data: data)
                else { completion(nil); return }
            
            completion(image)
        }
        
        dataTask.resume()
    }
}











