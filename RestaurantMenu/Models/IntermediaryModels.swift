//
//  IntermediaryModels.swift
//  RestaurantMenu
//
//  Created by Руслан Акберов on 30.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
