//
//  ContentView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        
        NavigationStack {
            
            TabView {
                CreationView()
                    .tabItem { Label("Créations", systemImage: "sun.max") }
                EventView()
                    .tabItem { Label("Évènements", systemImage: "calendar") }
                FavorisView()
                    .tabItem { Label("Favoris", systemImage: "heart") }
                PanierView(vide: false, articles: articles)
                    .tabItem { Label("Panier", systemImage: "basket") }
                ProfilView()
                    .tabItem { Label("Profil", systemImage: "person") }
            }.accentColor(.marron)
                .onAppear {
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance 
                }
            
        }
    }
}

#Preview {
    LandingView()
}
