//
//  ProfilView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct ProfilView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var dataFilter: DataFilterModel
    
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
                    
                    VStack {
                        Text("Bonjour \(dataFilter.userRef.user.firstName),")
                            .font(.custom("Italianno", size: 50))
                            .padding(-10)
                        Spacer()
                        if let imageFound = dataFilter.userRef.user.avatar.first {
                            AsyncImage(url: URL(string: imageFound.url)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                } else if phase.error != nil {
                                    Image("profil")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 150)
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 150, height: 150)
                        }
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
                        .font(.custom("Libre Franklin", size: 16))
                }
                
            }
            .sheet(isPresented: $isCardViewPresented) {
                FidelityView(firstName: dataFilter.userRef.user.firstName, lastName: dataFilter.userRef.user.lastName)
            }.padding(.vertical, 1)
            
            List {
                if dataFilter.userRef.user.role == "createur" {
                    NavigationLink(destination: AddArticleView()) {
                        Label("Ajouter un article", systemImage: "tshirt.circle")
                    }
                }
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
                
                Button {
                    dataFilter.isLogged = false
                    presentationMode.wrappedValue.dismiss() // Ferme la vue actuelle
                    
                }label: {
                    Label("Deconnexion", systemImage: "xmark.circle")
                }
                
            }.accentColor(.marron)
                .navigationBarHidden(true) // Cacher la barre de navigation
                .listStyle(InsetGroupedListStyle())
                .scrollContentBackground(.hidden)
                .foregroundColor(.marron)
                .fontWeight(.bold)
                .navigationTitle("") // Cacher le titre de la navigation bar
                .navigationBarTitleDisplayMode(.inline)
                .font(.custom("Libre Franklin", size: 16))
        }
        .accentColor(.marron)
    }
}



#Preview {
    ProfilView()
        .environmentObject(DataFilterModel())
}
