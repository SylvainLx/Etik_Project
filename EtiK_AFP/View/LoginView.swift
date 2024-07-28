//
//  LoginView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 20/10/2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userRequest: UserAPIRequest
    
    @Binding var pseudo: String
    @Binding var passWord: String
    @State var showPassword: Bool = false
    @Binding var isCorrect: Bool
    
    @State private var text: String = ""
    
    @State private var isNavigationActive = false
    
    var onLoginTapped: () -> Void
    
    
    var body: some View {
        
        NavigationStack {

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
                        VStack {
                            TextField("Pseudo", text: $pseudo)
                                .frame(width: 300)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.center)
                                .padding(.top, 296)
                                .textInputAutocapitalization(.never)

                            VStack(alignment: .trailing) {
                                if showPassword {
                                    TextField("Password",
                                              text: $passWord,
                                              prompt: Text("Mot de passe"))
                                        .frame(width: 300)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(8)
                                        .textInputAutocapitalization(.never)
                                } else {
                                    
                                    SecureField("Password",
                                                text: $passWord,
                                                prompt: Text("Mot de passe"))
                                    .frame(width: 300)
                                    .textFieldStyle(.roundedBorder)
                                    .multilineTextAlignment(.center)
                                    .padding(8)
                                    .textInputAutocapitalization(.never)
                                }
                                
                                Button(action: {
                                    showPassword.toggle()
                                }, label: {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .resizable()
                                        .frame(width: 25, height: 15)
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 30)
                                    
                                })
                                .offset( x:15, y: -40)
                            }
                        }.padding(.top, 30)
                        
                        Button{
                            onLoginTapped()
                            isLog()
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
                                    .stroke(.black, lineWidth: 2)
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
                .onAppear {
                    if isCorrect {
                        isNavigationActive = true
                    }
                }
                .background(
                    NavigationLink("", destination: ProfilView(), isActive: $isNavigationActive)
                )
            }
        }
    
    
    
    
    func isLog() {
        let users = userRequest.allUser
        
        if users.contains(where: { user in
            user.email == pseudo.lowercased() && user.password == passWord.lowercased()
        }) {
            isCorrect = true
            isNavigationActive = true
        }
    }

}

#Preview {
    var isCorrect: Bool = false
    var pseudo: String = ""
    var password: String = ""
    return LoginView(pseudo: .constant(pseudo), passWord: .constant(password), isCorrect: .constant(isCorrect), onLoginTapped: {})
        .environmentObject(UserAPIRequest())
}
