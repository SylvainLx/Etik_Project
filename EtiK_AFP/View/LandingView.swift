//
//  ContentView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LandingView: View {
    
    @StateObject var userRequest = UserAPIRequest()
      
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
                PanierView(vide: false)
                    .tabItem { Label("Panier", systemImage: "basket") }
                    .tag(4)
                ProfilView()
                    .tabItem { Label("Profil", systemImage: "person") }
                    .tag(5)
            }.accentColor(.marron)
                .onAppear {
                    Task {
                        userRequest.allUser = await userRequest.fetchedUser()
                    }
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                } 
                .environmentObject(userRequest)
    }
}

#Preview {
    LandingView()
        .environmentObject(UserAPIRequest())

}
