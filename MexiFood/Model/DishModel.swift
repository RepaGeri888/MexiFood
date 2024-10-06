//
//  DishModel.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 11..
//

import Foundation
import SwiftUI

struct Dish : Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var category: Category
    var price: Int
    var isFavorite: Bool
    var isPopular: Bool
    
    enum Category: String, CaseIterable, Codable {
        case soup = "Soups"
        case mainDish = "Main dishes"
        case dessert = "Desserts"
        case salad = "Salads"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

struct CartItem: Hashable, Codable, Identifiable {
    var id: Int
    var content: Dish
    var amount: Int
}

extension CartItem: Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.id == rhs.id
    }
}

class Cart: ObservableObject, Identifiable{
    @Published var cartContents: [CartItem] = []
    
    func addToCart(content: Dish, amount: Int) {
        let item = CartItem(id: content.id, content: content, amount: amount)
        if (!cartContents.contains(item)){
            cartContents.append(item)
        }
        else {
            var index: Int {
                cartContents.firstIndex(where: {$0.id == item.id})!
            }
            cartContents[index].amount = item.amount
        }
    }
    
    func removeFromCart(id: Int) {
        var i: Int = 0
        cartContents.forEach { item in
            if (item.id == id) {
                cartContents.remove(at: i)
            }
            i=i+1
        }
    }
    
    func changeAmount(amount: Int, cartItem: CartItem) {
        var index: Int {
            cartContents.firstIndex(where: { $0.id == cartItem.id })!
        }
        cartContents[index].amount += amount
    }
    
    func sumPrice() -> Int {
        var summedPrice = 0
        cartContents.forEach { item in
            summedPrice += item.amount*item.content.price
        }
        return summedPrice
    }
}

