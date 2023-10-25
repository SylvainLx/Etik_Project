//
//  ProfilView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                ZStack {
                    Circle()
                        .fill(.beige)
                        .frame(width: 475, height: 475)
                        .offset(CGSize(width: 0, height: -200))
                    
                    VStack {
                        Text("Profil  ")
                            .font(.custom("Italianno", size: 50))
                            .padding(-10)
                        
                        Image("profil")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 150)
                    }
                }
                .frame(width: 400, height: 300)
                
                List {
                    NavigationLink(destination: MyCommandsView()) {
                        Label("Mes commandes", systemImage: "purchased")
                    }
                    NavigationLink(destination: ReturnArticleView()) {
                        Label("Mes retours", systemImage: "arrow.backward.circle")
                    }

                    NavigationLink(destination: ModifCompteView()) {
                        Label("Mes informations", systemImage: "info.circle")
                    }

                    NavigationLink(destination: FollowedCreatorView(name: "Chloé Schwarz", entreprise: "Ribambelle", city: "Paris", img: "creatrice")) {
                        Label("Mes créateurs suivis", systemImage: "person")
                    }

                    NavigationLink(destination: NotifParamView()) {
                        Label("Mes paramètres notifications", systemImage: "bell")
                    }

                    NavigationLink(destination: RGPDView()) {
                        Label("Protection des données", systemImage: "lock.shield")
                    }

                }.accentColor(.marron)
                .navigationBarHidden(true) // Cacher la barre de navigation
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
                .foregroundColor(.marron)
                .fontWeight(.bold)
                .navigationTitle("") // Cacher le titre de la navigation bar
                .navigationBarTitleDisplayMode(.inline) 
               
               
            }
        }.accentColor(.marron)
    }
}

#Preview {
    ProfilView()
}
