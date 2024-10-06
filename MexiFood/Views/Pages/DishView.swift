//
//  DishView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 19..
//

import SwiftUI

struct ImageView: View {
    var image: Image
    
    var body: some View{
        VStack {
            image.resizable()
                .scaledToFit()
                .ignoresSafeArea()
        }
    }
}

struct DishView: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var cart: Cart
    var dish: Dish
    
    var dishIndex: Int {
        modelData.dishes.firstIndex(where: { $0.id == dish.id })!
    }
    
    var body: some View{
        VStack{
            VStack {
                ImageView(image: dish.image)
                VStack {
                    HStack{
                        Text(dish.name)
                            .font(.title)
                            .padding(.top)
                        Spacer()
                        FavoriteButton(isSet: $modelData.dishes[dishIndex].isFavorite)
                            .padding(.top)
                        Spacer()
                        Text(String(dish.price) + " Ft")
                            .font(.title2)
                            .padding(.top)
                    }
                    .padding([.leading, .trailing])
                    Divider()
                    ScrollView {
                        Text(dish.description).font(.title2).multilineTextAlignment(.leading)
                            .padding([.leading, .bottom, .trailing])
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
            AddToCartView(dish: dish, cart: cart)
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Group {
            DishView(cart: Cart(), dish: ModelData().dishes[1])
                .environmentObject(modelData)
            //            DishView(cart: Cart(), dish: ModelData().dishes[5])
            //                .previewDevice("iPod touch (7th generation)")
            //                .environmentObject(modelData)
        }
    }
}
