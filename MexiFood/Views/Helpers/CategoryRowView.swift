//
//  CategoryRowView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 22..
//

import SwiftUI

struct CategoryRowView: View {
    var categoryName: String
    var items: [Dish]
    @ObservedObject var cart: Cart
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { dish in
                        NavigationLink {
                            DishView(cart: cart, dish: dish)
                        } label: {
                            CategoryItemView(dish: dish)
                        }
                    }
                }
            }.frame(height: 185)
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var dishes = ModelData().dishes
    
    static var previews: some View {
        CategoryRowView(
            categoryName: dishes[0].category.rawValue, items: Array(dishes.prefix(4)), cart: Cart()
        )
    }
}
