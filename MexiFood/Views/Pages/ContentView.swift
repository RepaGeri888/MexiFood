//
//  ContentView.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 10..
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cart = Cart()
    
    @State private var selection: Tab = .offered
    
    enum Tab {
        case offered
        case menu
        case cart
    }
    
    var body: some View {
        TabView(selection: $selection){
            CategoryView(cart: cart)
                .tabItem {
                    Label("Offeres", systemImage: "star")
                }
                .tag(Tab.offered)
            
            MenuListView(cart: cart)
                .tabItem {
                    Label("Menu", systemImage: "list.bullet")
                }
                .tag(Tab.menu)
            
            CartView(cart: cart)
                .tabItem {
                    Label("Shopping cart", systemImage: "cart")
                }
                .tag(Tab.cart)
        }
        .accentColor(.pink)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE (2nd generation)"/*, "iPhone XS Max", "iPad Pro (12.9-inch) (5th generation)"*/], id: \.self) { deviceName in
                ContentView()
                    .environmentObject(ModelData())
                    .environmentObject(PopularData())
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
            .previewInterfaceOrientation(.portrait)
        }
    }
}
