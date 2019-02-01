//
//  Catagories.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBooks: Codable {
    let items: [Items]
}

struct Items: Codable {
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let description: String
    let imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}



