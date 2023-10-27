//
//  ProfilView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI


struct ProfilView: View {
    
    @EnvironmentObject var data: UserObservable
    @State private var isCardViewPresented = false
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ZStack {
                    RadialGradient(stops: [
                        .init(color: Color(.beige), location: 0.3),
                        .init(color: Color(.white), location: 0.3),
                    ], center: .top, startRadius: 100, endRadius: 600)
                    .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        Text("Bonjour")
                            .font(.custom("Italiana", size: 20))
                        
                        if data.user.avatar.isEmpty == false {
                            Text(data.user.firstName + data.user.lastName)
                                .font(.custom("Italianno", size: 50))
                        } else {
                            Text("Emma White")
                                .font(.custom("Italianno", size: 50))
                        }
                        
                        if data.user.avatar.isEmpty == false {
                            AsyncImage(url: URL(string: String(data.user.avatar[0].url))) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFit()
                                    .clipShape(Circle())
                                
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 150)
                        } else {
                            Image("profil")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 150)
                        }
                    }
                }
                .frame(width: 400, height: 300)
                
                 
                Button {
                    isCardViewPresented.toggle()
                } label: {
                    VStack {
                        Image(systemName: "creditcard.fill")
                            .font(.system(size: 30))
                        Text("Carte de fidélité")
                            .font(.custom("Libre Franklin", size: 15))
                    }
                   
                }
                .sheet(isPresented: $isCardViewPresented) { 
                    FidelityView()
                }.padding(.vertical, 1)
                
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
                    NavigationLink(destination: LangueView()) {
                        Label("Langue", systemImage: "character.bubble")
                    }
                    NavigationLink(destination: AboutView()) {
                        Label("A propos", systemImage: "questionmark.app")
                    }
                    NavigationLink(destination: SupportView()) {
                        Label("Support", systemImage: "ellipsis.message")
                    }
                }.accentColor(.marron)
                    .navigationBarHidden(true) // Cacher la barre de navigation
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.marron)
                    .fontWeight(.bold)
                    .navigationTitle("") // Cacher le titre de la navigation bar
                    .navigationBarTitleDisplayMode(.inline)
                    .font(.custom("Libre Franklin", size: 15))
                
                
            }
            .accentColor(.marron)
            .environmentObject(data)
        }
    }
    
}

#Preview {
    ProfilView()
        .environmentObject(UserAPIRequest())
        .environmentObject(UserObservable(user: User(firstName: "", avatar: [DataBaseImage](), id: "", lastName: "", email: "", phone: "", adress: "", postalCode: 0, city: "", password: "", transactions: [String]())))
}
