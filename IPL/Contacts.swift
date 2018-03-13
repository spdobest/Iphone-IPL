//
//  Contacts.swift
//  IPL
//
//  Created by sibaprasad on 13/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
struct Contacts :Codable{
    let address:String?
    let gender:String?
    let id:String?
    let name:String?
    let phone:[Phone]?
}

