//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/10/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
