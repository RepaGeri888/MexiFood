//
//  MenuListView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 19..
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var presented: Bool = false
    @State private var category: Dish.Category? = nil
    @ObservedObject var cart: Cart
    
    var filteredDishesFavorite: [Dish]? {
        modelData.dishes.filter {
            dish in
            (!showFavoritesOnly || dish.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                ScrollView(.horizontal) {
                    HStack {
                        Button(action: { category = Dish.Category.soup }) {
                            Text("Soups")
                        }
                        Button(action: { category = Dish.Category.mainDish }) {
                            Text("Main dishes")
                        }
                        Button(action: { category = Dish.Category.salad }) {
                            Text("Salads")
                        }
                        Button(action: { category = Dish.Category.dessert }) {
                            Text("Desserts")
                        }
                        Button(action: { category = nil }) {
                            Text("All")
                        }
                    }
                }
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                if (filteredDishesFavorite != nil) {
                    ForEach(filteredDishesFavorite!) { dish in
                        if (category == nil) {
                            NavigationLink {
                                DishView(cart: cart, dish: dish)
                            } label: {
                                MenuView(dish: dish)
                            }
                        }
                        else if (dish.category == category) {
                            NavigationLink {
                                DishView(cart: cart, dish: dish)
                            } label: {
                                MenuView(dish: dish)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Dishes")
            .listStyle(.plain)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (2nd generation)"/*, "iPhone XS Max", "iPad Pro (12.9-inch) (5th generation)"*/], id: \.self) { deviceName in
                MenuListView(cart: Cart())
                    .environmentObject(ModelData())
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
            .previewInterfaceOrientation(.portrait)
        }
    }
}
