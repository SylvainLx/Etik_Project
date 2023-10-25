//
//  ContentView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LandingView: View {
      
    var body: some View {
        
    
            TabView {
                CreationView()
                    .tabItem { Label("Créations", systemImage: "sun.max") }
                    .tag(0)
                EventView()
                    .tabItem { Label("Évènements", systemImage: "calendar") }
                    .tag(1) 
                FavorisView()
                    .tabItem { Label("Favoris", systemImage: "heart") }
                    .tag(3)
                PanierView(vide: false, articles: articles)
                    .tabItem { Label("Panier", systemImage: "basket") }
                    .tag(4)
                ProfilView()
                    .tabItem { Label("Profil", systemImage: "person") }
                    .tag(5)
            }.accentColor(.marron)
                .onAppear {
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                } 
      
    }
}

#Preview {
    LandingView()
}
