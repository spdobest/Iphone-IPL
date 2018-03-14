//
//  MyContacts.swift
//  IPL
//
//  Created by sibaprasad on 13/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
struct MyContacts :Decodable{
     let contacts:[Contacts]
    
    enum CodingKeys : String, CodingKey {
        case contacts = "contacts"
    }
    
}
