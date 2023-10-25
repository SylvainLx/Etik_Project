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
                    NavigationLink("Mes commandes", destination: MyCommandsView())
                    NavigationLink("Mes retours", destination: ReturnArticleView())
                    NavigationLink("Mes informations", destination: ModifCompteView())
                    NavigationLink("Mes créateurs suivis", destination: FollowedCreatorView(name: "Chloé Schwarz", entreprise: "Ribambelle", city: "Paris", img: "creatrice"))
                    NavigationLink("Mes notifications", destination: NotifParamView())
                    NavigationLink("Protection des données", destination: RGPDView())
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
