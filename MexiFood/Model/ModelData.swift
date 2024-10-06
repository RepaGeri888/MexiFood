//
//  ModelData.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 11..
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var dishes: [Dish] = load("mexiMenu.json")
    
    var popular: [Dish] {
        dishes.filter { $0.isPopular }
    }
    
    var categories: [String: [Dish]] {
        Dictionary(
            grouping: dishes, by: { $0.category.rawValue })
    }
}

final class PopularData: ObservableObject {
    @Published var popularDishes: [Dish] = dishes.filter { $0.isPopular }
    
    var categories: [String: [Dish]] {
        Dictionary(
            grouping: popularDishes, by: { $0.category.rawValue})
    }
}

var dishes:[Dish] = load("mexiMenu.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
