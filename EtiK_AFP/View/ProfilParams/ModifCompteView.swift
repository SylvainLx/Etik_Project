//
//  ModifCompteView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 20/10/2023.
//

import SwiftUI

struct ModifCompteView: View {
    
    @EnvironmentObject var data: UserObservable

    
    var body: some View {
        
        VStack {
            TitleCard(title: "Modifier mes informations")
            ScrollView {
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.beige)
                        .padding()
                    
                    VStack{
                        Button{
                        } label: {
                            Image("ProfilPic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                        
                        TextField("Nouveau Prénom", text: $data.user.firstName)
                            .frame(width: 300)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                        
                        TextField("Nouveau Nom", text: $data.user.lastName)
                            .frame(width: 300)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                        
                        TextField("Nouvelle adresse mail", text: $data.user.email)
                            .frame(width: 300)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                        
                        SecureField("Nouveau mot de passe", text: $data.user.password)
                            .frame(width: 300)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                        
                        TextField("Nouvelle adresse", text: $data.user.adress)
                            .frame(width: 300)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.center)
                            .padding(.top, 8)
                        
                        HStack{
                            TextField("Code postal", value: $data.user.postalCode, formatter: NumberFormatter())
                                .frame(width: 146)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading], 8)
                            
                            TextField("Nouvelle ville", text: $data.user.city)
                                .frame(width: 146)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 8)
                        }
                        
                        Button{
                            
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.marron)
                                    .frame(width: 300, height: 50)
                                Text("Enregistrer les modifications")
                                    .foregroundStyle(.white)
                                    .font(.custom("Italiana", size: 20))
                            }
                        }
                        .padding(8)
                        
                        Button{
                            
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.red)
                                    .frame(width: 300, height: 50)
                                Text("Annuler")
                                    .foregroundStyle(.white)
                                    .font(.custom("Italiana", size: 20))
                            }
                        }
                    }
                    .padding(.bottom, 100)
                    
                }
                .padding(.top, 100.0)
            }
        }
        .environmentObject(data)
    }
}

#Preview {
    ModifCompteView()
        .environmentObject(UserAPIRequest())
        .environmentObject(UserObservable(user: User(firstName: "", avatar: [DataBaseImage](), id: "", lastName: "", email: "", phone: "", adress: "", postalCode: 0, city: "", password: "", transactions: [String]())))
}
