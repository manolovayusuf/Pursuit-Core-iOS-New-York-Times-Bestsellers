//
//  Books.swift
//  NYTBestsellers
//
//  Created by Manny Yusuf on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestsellers: Codable {
        let results: [Books]
    }
    
    struct Books: Codable {
        let list_name: String
        let display_name: String
        let rank: Int
        let rank_last_week: Int
        let weeks_on_list: Int 
        let amazon_product_url: String
        let book_details: [BookDetail]
    }
    
    struct BookDetail: Codable {
        let title: String
        let description: String
        let contributor: String
        let author: String
        let contributor_note: String
        let price: Double
        let publisher: String
        let primary_isbn13: String
    }

