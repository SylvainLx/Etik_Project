//
//  DataFilterModel.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 30/10/2023.
//

import Foundation

class DataFilterModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var transactions = [Transaction]()
    @Published var productsTransaction = [Product]()

    @Published var userRequest = UserAPIRequest()
    @Published var transactionsRequest = TransactionAPIRequest()
    @Published var productsRequest = ProductsAPIRequest()
    @Published var eventRequest = EventAPIRequest()
    @Published var creatorRequest = CreatorAPIRequest()

    
    @Published var userRef: UserObservable = UserObservable(user: User(firstName: "", avatar: [DataBaseImage](), id: "", lastName: "", email: "", phone: "", adress: "", postalCode: 0, city: "", password: "", transactions: [String](), role: ""))
    
    @Published var transactionRef: TransactionObservable = TransactionObservable(transaction: [Transaction(id: "", user: [String](), products: [String](), retour: "", statutCommande: [String](), statutRetour: [String](), creator: [String](), idProduitFromProducts: [String](), idFromCreator: [String](), idFromUser: [String]())])
    
    @Published var productsTransactionRef: TransactionToProducts = TransactionToProducts(transactionToProducts: [Product(id: "", name: "", photo: [DataBaseImage](), description: "", category: [String](), price: 0.0, sizes: [String](), quantity: 0, collection: [String](), transactions2: [String](), creator: [String](), idFromCreator: [String](), url: "")])
    
    @Published var pseudo = String()
    @Published var mdp = String()
    @Published var isLogged = Bool()
  
    func isLog() {
        if let user = userRequest.allUser.first(where: { $0.email == pseudo && $0.password == mdp }) {
            isLogged = true
            userRef.user = user
            var userTransactions = transactionsRequest.allTransaction.filter { $0.idFromUser.contains(user.id) }
            let excludedTransactionID = "01"
                    userTransactions = userTransactions.filter { $0.id != excludedTransactionID }
            transactionRef.transaction = userTransactions
            
            var productIDs = [String]()
                  for transaction in userTransactions {
                      productIDs.append(contentsOf: transaction.idProduitFromProducts)
                  }

                  productsTransactionRef.transactionToProducts = productsRequest.allProducts.filter { product in
                      return productIDs.contains(product.id)
                  }
        }
    }
}
