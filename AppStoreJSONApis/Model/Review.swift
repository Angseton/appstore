//
//  Review.swift
//  AppStoreJSONApis
//
//  Created by Gastón Máspero on 31/01/2020.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import Foundation

struct Review: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let title: Label
    let content: Label
    let author: Author
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Label: Decodable {
    let label: String
}

struct Author: Decodable {
    let name: Label
}
