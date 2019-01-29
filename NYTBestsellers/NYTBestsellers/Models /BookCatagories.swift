//
//  BookType.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookCatagories: Codable {
    let results: [Results]
}

struct Results: Codable {
    let list_name: String
    let display_name: String
    let oldest_published_date: String
    let newest_published_date: String
    let updated: String
}
