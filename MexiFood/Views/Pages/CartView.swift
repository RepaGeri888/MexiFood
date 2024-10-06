//
//  CartView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 27..
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart
    @State private var alertIsPresented = false
    @State private var sumPrice = 0
    
    var body: some View {
        VStack {
            if(cart.cartContents.count != 0) {
                List(cart.cartContents) { item in
                    VStack {
                        Text(item.content.name)
                            .font(.title2)
                            .foregroundColor(Color.pink)
                            .padding(.vertical, 5.0)
                            .padding(.horizontal, 8.0)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .padding(.top, 5.0)
                        
                        HStack {
                            Spacer()
                            Button(action: { if item.amount > 1{ cart.changeAmount(amount: -1, cartItem: item) } }) {
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
                            
                            Text("\(item.amount)")
                                .font(.system(size: 30))
                                .padding(5)
                            
                            Button(action: { cart.changeAmount(amount: 1, cartItem: item)}) {
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
                            }
                            .buttonStyle(PlainButtonStyle())
                            Spacer()
                            
                            Button(action: {cart.removeFromCart(id: item.content.id)}) {
                                Text("Remove")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                    .padding(.horizontal,UIScreen.main.bounds.height < 750 ? 20 : 40)
                                    .background(Color.black)
                                    .clipShape(Capsule())
                                    .padding(.trailing)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, 5.0)
                            Spacer()
                        }
                    }
                    .background(Color.cyan)
                }
                .listStyle(.plain)
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Total price: " + String(cart.sumPrice()) + "Ft")
                        .foregroundColor(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,UIScreen.main.bounds.height < 750 ? 20 : 40)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                    Button(action: {self.alertIsPresented = true}) {
                        Text("Order")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal,UIScreen.main.bounds.height < 750 ? 20 : 40)
                            .background(Color.gray)
                            .clipShape(Capsule())
                            .padding(.trailing)
                            .alert(isPresented: $alertIsPresented, content: {
                                Alert(title: Text("Order placed!"))
                            })
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 10)
            }
            else {
                Text("Cart is empty")
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: Cart())
    }
}
