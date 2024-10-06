//
//  MexiFoodApp.swift
//  MexiFood
//
//  Created by RGeri on 2021. 11. 10..
//

import SwiftUI

@main
struct MexiFoodApp: App {
    @StateObject private var modelData = ModelData()
    @StateObject private var popularData = PopularData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(popularData)
        }
    }
}
