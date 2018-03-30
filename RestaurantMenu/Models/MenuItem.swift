//
//  MenuItem.swift
//  RestaurantMenu
//
//  Created by Руслан Акберов on 30.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageUrl = "image_url"
    }
}

struct MenuItems: Codable {
    var items: [MenuItem]
}
