//
//  NetworkManager.swift
//  GitHub
//
//  Created by Kinney Kare on 2/10/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        //set URL
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        //since the current endpoint is a string we need to convert this into a URL Object (we use a guard statement to do this)
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //data, response and error are all optionals so we must unwrap them. NOTE: error = normally internet issue. Response = an issue with the server
            if let _ = error {
                completed(nil, .unableToComplete)
                return
            }
            
            //statusCode == 200 means OK or that everything went correctly as far as the URL response.
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completed(nil, .invalidData)
                return
            }
            
            //if everything has checked out correctly we now have a constant called data and now we can start the parse.
            
            do {
                //the decoder takes the data from the server and decoding it into our objects.
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, .invalidData)
            }
        }
        //MUST put task.resume() to actually START the network call.
        task.resume()
    }
    
}
