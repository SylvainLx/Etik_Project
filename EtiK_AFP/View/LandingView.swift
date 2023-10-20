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
            EventView()
                .tabItem { Label("Évènements", systemImage: "calendar") }
            FavorisView()
                .tabItem { Label("Favoris", systemImage: "heart") }
            PanierView()
                .tabItem { Label("Panier", systemImage: "basket") }
            ProfilView()
                .tabItem { Label("Profil", systemImage: "person") }
        }.accentColor(.marron)
        
    }
}

#Preview {
    LandingView()
}
