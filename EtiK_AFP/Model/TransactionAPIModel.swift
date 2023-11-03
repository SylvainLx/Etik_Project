// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - TransactionRequest
struct TransactionRequest: Codable {
    let records: [TransactionRecord]
}

// MARK: - Record
struct TransactionRecord: Codable {
    let id, createdTime: String
    let fields: Transaction
}

// MARK: - Transaction
struct Transaction: Codable, Identifiable {
    var id: String
    var user: [String]
    var products: [String]
    var retour: String
    var statutCommande: [String]
    var statutRetour: [String]
    var creator: [String]
    var idProduitFromProducts: [String]
    var idFromCreator: [String]
    var idFromUser: [String]


       enum CodingKeys: String, CodingKey {
           case id, user
           case products = "Products"
           case retour, statutCommande, statutRetour
           case creator = "Creator"
           case idProduitFromProducts = "ID Produit (from Products)"
           case idFromCreator = "id (from Creator)"
           case idFromUser = "id (from user)"

       }
}

class TransactionObservable: ObservableObject {
    @Published var transaction: [Transaction]
    
    init(transaction: [Transaction]) {
        self.transaction = transaction
    }
}

