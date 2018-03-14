//
//  Blog.swift
//  IPL
//
//  Created by sibaprasad on 15/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
struct Blog: Decodable {
    let title: String
    let homepageURL: URL
    let articles: [Article]
    
    enum CodingKeys : String, CodingKey {
        case title
        case homepageURL = "home_page_url"
        case articles = "items"
    }
}

struct Article: Decodable {
    let id: String
    let url: URL
    let title: String
}
