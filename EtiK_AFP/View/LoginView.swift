//
//  LoginView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 20/10/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var pseudo: String = ""
    @State private var passWord: String = ""
    
    var body: some View {
        ZStack{
        
            Circle()
                .fill(.beige)
                .frame(width: 475, height: 475)
                .offset(CGSize(width: 0, height: -350))
            Button{
                
            } label: {
                Image("ProfilPic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(CGSize(width: 0, height: -150))
                
            }
            VStack {
                TextField("Pseudo", text: $pseudo)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.top, 296)
                
                TextField("Mot de passe", text: $passWord)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(8)
                
                Button{
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.marron)
                            .frame(width: 300, height: 50)
                        Text("Connexion")
                            .foregroundStyle(.white)
                            .font(.custom("Italiana", size: 20))
                    }
                }
                .padding(8)
                
                Button{
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 4)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            
                        Text("Inscription")
                            .foregroundStyle(.black)
                            .font(.custom("Italiana", size: 20))
                        
                        
                    }
                }
                .padding(8)
                
                Button{
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                        
                            .foregroundColor(.black)
                            .frame(width: 300, height: 50)
                        HStack{
                            Image(systemName: "apple.logo")
                                .foregroundStyle(.white)
                            
                            Text("Sign in with apple")
                                .foregroundStyle(.white)
                                .font(.custom("Italiana", size: 20))
                            
                        }
                    }
                }
                .padding(8)
                
                Button{
                    
                } label: {
                        
                        Text("Mot de passe oublié ?")
                            .foregroundStyle(.blue)
                            .font(.custom("Italiana", size: 20))
                        
                }
                .padding(8)
            }
        }
    }
}

#Preview {
    LoginView()
}
