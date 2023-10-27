//
//  CheckLogView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 26/10/2023.
//

import SwiftUI

struct CheckLogView: View {
    
    @EnvironmentObject var userRequest: UserAPIRequest

    @State private var isLogged: Bool = false
    @State private var pseudo = ""
    @State private var mdp = ""
    
    @StateObject var userRef: UserObservable = UserObservable(user: User(firstName: "", avatar: [DataBaseImage](), id: "", lastName: "", email: "", phone: "", adress: "", postalCode: 0, city: "", password: "", transactions: [String]()))
    
    
    var body: some View {
        NavigationStack {
                    if isLogged {
                        NavigationLink("", destination: ProfilView(), isActive: $isLogged)
                    } else {
                        LoginView(pseudo: $pseudo, passWord: $mdp, isCorrect: $isLogged, onLoginTapped: isLog)
                    }
        }
        .environmentObject(userRef)
    }
    
    func isLog() {
        let users = userRequest.allUser
        
        if let user = users.first(where: { $0.email == pseudo.lowercased() && $0.password == mdp.lowercased() }) {
            isLogged = true
            userRef.user = user
            print(user)
        }
    }
}

#Preview {
    CheckLogView()
        .environmentObject(UserAPIRequest())
}
