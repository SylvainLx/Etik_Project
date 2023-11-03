//
//  LoginView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 20/10/2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel
   
    @State var showPassword: Bool = false
    
    @State private var text: String = ""
    
    @State private var isNavigationActive = false
    
    var body: some View {
        
        
        NavigationStack {
            
            VStack {
                
                VStack {
                    ZStack {
                        RadialGradient(stops: [
                            .init(color: Color(.beige), location: 0.3),
                            .init(color: Color(.white), location: 0.3),
                        ], center: .top, startRadius: 100, endRadius: 600)
                        .ignoresSafeArea()
                        
                        VStack {
                            Spacer()
                            Image("icone")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                    }
                }.frame(width: 400, height: 250)
         
                Spacer()
                
                TextField("Pseudo", text: $dataFilter.pseudo)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.beige, lineWidth: 2)
                            .frame(height: 40)
                    ).padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .textInputAutocapitalization(.never)
                    .font(.custom("Libre Franklin", size: 16))
                
                ZStack(alignment: .bottomTrailing) {
                    if showPassword {
                        TextField("Password",
                                  text: $dataFilter.mdp,
                                  prompt: Text("Mot de passe"))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .textInputAutocapitalization(.never)
                            .font(.custom("Libre Franklin", size: 16))
                    } else {
                        
                        SecureField("Password",
                                    text: $dataFilter.mdp,
                                    prompt: Text("Mot de passe"))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .textInputAutocapitalization(.never)
                            .font(.custom("Libre Franklin", size: 16))
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .resizable()
                            .frame(width: 25, height: 15)
                            .foregroundColor(.marron)
                        
                        
                    }).padding(.bottom, 18)
                        .padding(.trailing, 25)
                }
                    
                Button{
                    dataFilter.isLog()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.marron)
                            .frame(width: 300, height: 50)
                        Text("Connexion")
                            .foregroundStyle(.white)
                            .font(.custom("Libre Franklin", size: 16))
                    }
                }
                .padding(8)
                
                Button{
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.black, lineWidth: 2)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                        
                        Text("Inscription")
                            .foregroundStyle(.black)
                            .font(.custom("Libre Franklin", size: 16))
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
                                .font(.custom("Libre Franklin", size: 16))

                        }
                    }
                }
                .padding(8)
                
                Button{
                    
                } label: {
                    
                    Text("Mot de passe oublié ?")
                        .foregroundStyle(.blue)
                        .font(.custom("Libre Franklin", size: 16))

                }
                .padding(8)
                
                
                
                
            }
            .onAppear {
                if dataFilter.isLogged {
                    isNavigationActive = true
                }
            }
            .background(
                NavigationLink("", destination: ProfilView(), isActive: $isNavigationActive)
            )
        }
    }
    
}

#Preview {
    var isCorrect: Bool = false
    var pseudo: String = ""
    var password: String = ""
    return LoginView()
        .environmentObject(DataFilterModel())
}
