//
//  MyGitHub.swift
//  IPL
//
//  Created by sibaprasad on 13/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
struct MyGitHub: Codable {
    
    let name: String?
    let location: String?
    let blog: URL?
    let followers: Int?
    let avatarUrl: URL?
    let repos: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case location
        case blog
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
        
    }
}
