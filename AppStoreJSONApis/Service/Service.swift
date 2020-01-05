//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/4/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch apps:", error)
                completion([], error)
            }
            
            guard let data = data else { return }
            
            do {
                let jsonString = String(data: data, encoding: .utf8)
                print(jsonString)
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                searchResult.results.forEach {
                    print($0.trackName, $0.primaryGenreName)
                }
                completion(searchResult.results, nil)
            } catch let jsonError {
                print("Failed to decode json:", jsonError)
                completion([], jsonError)
            }
            
            }.resume()
    }
}
