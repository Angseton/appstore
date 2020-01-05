//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/4/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}
