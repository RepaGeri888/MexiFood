//
//  AddToCartView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 27..
//

import SwiftUI



struct AddToCartView: View {
    @State private var count = 1
    @State private var alertIsPresented = false
    @EnvironmentObject var modelData: ModelData
    var dish: Dish
    @ObservedObject var cart: Cart
    
    var body: some View {
        VStack {
        HStack {
            Button(action: { if count > 1{ count -= 1 } }) {
                Image(systemName: "minus")
                    .frame(width: 5, height: 5)
                    .font(.system(size: 15))
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.black, lineWidth: 1)
                    }
                    .foregroundColor(Color.blue)
                    .padding(.leading)
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("\(count)")
                .font(.system(size: 30))
                .padding(5)
            
            Button(action: { count += 1 }) {
                Image(systemName: "plus")
                    .frame(width: 5, height: 5)
                    .font(.system(size: 15))
                    .foregroundColor(Color.red)
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.black, lineWidth: 1)
                    }
            }.buttonStyle(PlainButtonStyle())
            Spacer(minLength: 0)
            
            Button(action: { cart.addToCart(content: dish, amount: count); self.alertIsPresented = true }){
                Text("Add to Cart")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,UIScreen.main.bounds.height < 750 ? 20 : 40)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding(.trailing)
                    .alert(isPresented: $alertIsPresented, content: {
                        Alert(title: Text("Item added to cart!"))
                    })
            }.buttonStyle(PlainButtonStyle())
        }.frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.cyan)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 62)
    }
}

struct AddToCartView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        AddToCartView(dish: modelData.dishes[1], cart: Cart())
            .environmentObject(modelData)
    }
}
