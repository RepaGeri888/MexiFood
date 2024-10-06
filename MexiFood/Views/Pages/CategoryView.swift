//
//  CategoryView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 22..
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var popularData: PopularData
    @ObservedObject var cart: Cart
    var body: some View {
        NavigationView {
            List {
                Image("Tacos")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .opacity(0.8)
                
                ForEach(popularData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, items: popularData.categories[key]!, cart: cart)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Best Offers")
            .padding(.top, -250)
            .listStyle(.plain)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(cart: Cart())
            .environmentObject(PopularData())
    }
}
