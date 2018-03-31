//
//  MenuController.swift
//  RestaurantMenu
//
//  Created by Руслан Акберов on 30.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

class MenuController {
    let baseUrl = URL(string: "http://localhost:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryUrl = baseUrl.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryUrl) { (data, response, error) in
            if let data = data, let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any], let categories = jsonDictionary?["categories"] as? [String] {
                completion(categories)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fethcMenuItems(categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        let initialMenuUrl = baseUrl.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuUrl, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "menu", value: categoryName)]
        let menuUrl = components.url!
        let task = URLSession.shared.dataTask(with: menuUrl) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data) {
                completion(menuItems.items)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func submitOrder(menuIds: [Int], completion: @escaping (Int?) -> Void) {
        let orderUrl = baseUrl.appendingPathComponent("order")
        var request = URLRequest(url: orderUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data) {
                completion(preparationTime.prepTime)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}











