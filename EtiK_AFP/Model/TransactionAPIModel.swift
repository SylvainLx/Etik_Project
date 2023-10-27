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
struct Transaction: Codable {
    let id: String
    let user, products: [String]
    let retour: String
    let statutCommande, statutRetour, idFromIDCréateurFromProducts, idCréateurFromProducts: [String]
    let idProduitFromProducts: [Int]

    enum CodingKeys: String, CodingKey {
        case id, user
        case products = "Products"
        case retour, statutCommande, statutRetour
        case idFromIDCréateurFromProducts = "id (from ID Créateur) (from Products)"
        case idCréateurFromProducts = "ID Créateur (from Products)"
        case idProduitFromProducts = "ID Produit (from Products)"
    }
}
