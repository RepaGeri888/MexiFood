//
//  CategoryItemView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 22..
//

import SwiftUI

struct CategoryItemView: View {
    var dish: Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            dish.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(dish.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(dish: ModelData().dishes[0])
    }
}
