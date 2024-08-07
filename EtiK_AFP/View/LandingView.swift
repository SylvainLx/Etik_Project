//
//  ContentView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LandingView: View {
    
    @StateObject var userRequest = UserAPIRequest()
    @StateObject var productRequest = ProductsAPIRequest()
      
    
    var body: some View {
        
            TabView {
               
                CreationView()
                    .tabItem { Label("Créations", systemImage: "sun.max") }
                    .environmentObject(productRequest)
                EventView()
                    .tabItem { Label("Évènements", systemImage: "calendar") }
                FavorisView()
                    .tabItem { Label("Favoris", systemImage: "heart") }
                PanierView(vide: false, articles: articles)
                    .tabItem { Label("Panier", systemImage: "basket") }
                    .tag(4)
                CheckLogView()
                    .tabItem { Label("Profil", systemImage: "person") }
                    .tag(5)
            }.accentColor(.marron)
                .onAppear {
                    Task {
                        userRequest.allUser = await userRequest.fetchedUser()
                        productRequest.allProducts = await productRequest.fetchedProducts()
                    }
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                }  
    }
}

#Preview {
    LandingView()
        .environmentObject(UserAPIRequest())
        .environmentObject(ProductsAPIRequest())

}
