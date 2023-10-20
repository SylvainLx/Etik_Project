//
//  ModifCompteView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 20/10/2023.
//

import SwiftUI

struct ModifCompteView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var passWord: String = ""
    @State private var adresse: String = ""
    @State private var postalCode: Int = 0000
    @State private var ville: String = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.beige)
            
            VStack{
                Button{
                } label: {
                    Image("ProfilPic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
                TextField("Nouveau Prénom", text: $firstName)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                TextField("Nouveau Nom", text: $lastName)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                TextField("Nouvelle adresse mail", text: $email)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                TextField("Nouveau mot de passe", text: $passWord)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                TextField("Nouvelle adresse", text: $adresse)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                HStack{
                    TextField("Code postal", value: $postalCode, formatter: NumberFormatter())
                        .frame(width: 146)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading], 8)
                    
                    TextField("Nouvelle ville", text: $ville)
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

#Preview {
    ModifCompteView()
}
