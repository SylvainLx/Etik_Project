//
//  ModifCompteView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 20/10/2023.
//

import SwiftUI

struct ModifCompteView: View {
        
    @EnvironmentObject var dataFilter: DataFilterModel

    
    var body: some View {
        
        VStack {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(.beige), location: 0.3),
                    .init(color: Color(.white), location: 0.3),
                ], center: .top, startRadius: 100, endRadius: 600)
                .ignoresSafeArea()
                
                VStack {
                    TitleCard(title: "Mes informations")
                    
                    Spacer()
                    
                    ZStack(alignment: .bottomTrailing) {
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
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .resizable()
                                .foregroundColor(.marron)
                                .background(.white)
                                .clipShape(Circle())
                                .frame(width: 35, height: 35)
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                        }
                    }.padding(.bottom, 40)
                }
            }
        }.frame(width: 400, height: 250)
        VStack {
            
            ScrollView {
                VStack{
                    
                    
                    TextField("Nouveau Prénom", text: $dataFilter.userRef.user.firstName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                    
                    TextField("Nouveau Nom", text: $dataFilter.userRef.user.lastName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                    
                    TextField("Nouvelle adresse mail", text: $dataFilter.userRef.user.email)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                    
                    SecureField("Nouveau mot de passe", text: $dataFilter.userRef.user.password)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                    
                    TextField("Nouvelle adresse", text: $dataFilter.userRef.user.adress)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                    
                    HStack{
                        TextField("Code postal", value: $dataFilter.userRef.user.postalCode, formatter: NumberFormatter())
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.beige, lineWidth: 2)
                                    .frame(height: 40)
                            ).padding(.horizontal)
                        
                        TextField("Nouvelle ville", text: $dataFilter.userRef.user.city)
                           
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.beige, lineWidth: 2)
                                    .frame(height: 40)
                            ).padding(.horizontal)
                    }
                }
                    .font(.custom("Libre Franklin", size: 16))

                
                LargeButton(labelButton: "Enregistrer les modifications", colorSelect: .marron)
                    .padding(.top)
                LargeButton(labelButton: "Annuler",  colorSelect: .red)
                    .padding(.bottom)
            }.padding(.bottom)
           
        }
        
        }
    }


#Preview {
    ModifCompteView()
        .environmentObject(DataFilterModel())
}
