//
//  MenuView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 22..
//

import SwiftUI

struct MenuView: View {
    
    var dish: Dish
    
    var body: some View {
        HStack {
            dish.image
                .resizable()
                .frame(width: 160, height: 90)
            
            VStack {
                Text(dish.name)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                HStack {
                    Text(String(dish.price) + " Ft")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    if dish.isFavorite {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var dishes = ModelData().dishes
    
    static var previews: some View {
        Group {
            MenuView(dish: dishes[0])
            MenuView(dish: dishes[2])
        }
        .previewLayout(.fixed(width: 300, height: 90))
    }
}
