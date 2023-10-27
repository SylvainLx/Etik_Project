//
//  CheckLogView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 26/10/2023.
//

import SwiftUI

struct CheckLogView: View {
    
    @EnvironmentObject var userRequest: UserAPIRequest
    @EnvironmentObject var transactionsRequest: TransactionAPIRequest


    @State private var isLogged: Bool = false
    @State private var pseudo = ""
    @State private var mdp = ""
    
    @StateObject var userRef: UserObservable = UserObservable(user: User(firstName: "", avatar: [DataBaseImage](), id: "", lastName: "", email: "", phone: "", adress: "", postalCode: 0, city: "", password: "", transactions: [String]()))
    
    @StateObject var transactionRef: TransactionObservable = TransactionObservable(transaction: Transaction(id: "", user: [String](), products: [String](), retour: "", statutCommande: [String](), statutRetour: [String](), creator: [String](), idProduitFromProducts: [String](), idFromCreator: [String](), idFromUser: [String]()))
    
    @State var toto = [String]()
    
    var body: some View {
        NavigationStack {
                    if isLogged {
                        NavigationLink("", destination: ProfilView(), isActive: $isLogged)
                    } else {
                        LoginView(pseudo: $pseudo, passWord: $mdp, isCorrect: $isLogged, onLoginTapped: isLog)
                    }
        }
        .environmentObject(userRef)
        .environmentObject(transactionRef)
    }
    
    func isLog() {
        let users = userRequest.allUser
        let transactions = transactionsRequest.allTransaction

        if let user = users.first(where: { $0.email == pseudo.lowercased() && $0.password == mdp.lowercased() }) {
            isLogged = true
            userRef.user = user
            let userTransactions = transactions.filter { $0.idFromUser.first == user.id }
                        if let transaction = userTransactions.first {
                        transactionRef.transaction = transaction
                    }
        }
    }
}

#Preview {
    CheckLogView()
        .environmentObject(UserAPIRequest())
        .environmentObject(TransactionAPIRequest())
}
