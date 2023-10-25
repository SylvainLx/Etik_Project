// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - ProductRequest
struct ProductRequest: Codable {
    let records: [ProductRecord]
}

// MARK: - ProductRecord
struct ProductRecord: Codable {
    let id, createdTime: String
    let fields: Product
}

// MARK: - Product
struct Product: Codable {
    let idProduit: Int
    let idCréateur: [String]
    let nom: String
    let photo: [DataBaseImage]
    let description: String
    let catégories: [String]
    let prix: Double
    let tailles: [String]
    let quantitéDispo: Int
    let collection, transactions2, idFromIDCréateur: [String]

    enum CodingKeys: String, CodingKey {
        case idProduit = "ID Produit"
        case idCréateur = "ID Créateur"
        case nom = "Nom"
        case photo = "Photo"
        case description = "Description"
        case catégories = "Catégories"
        case prix = "Prix"
        case tailles = "Tailles"
        case quantitéDispo = "Quantité dispo"
        case collection = "Collection"
        case transactions2 = "Transactions 2"
        case idFromIDCréateur = "id (from ID Créateur)"
    }
}
