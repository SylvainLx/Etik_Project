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
struct Product: Codable, Identifiable {
    let id: String
    let name: String
    let photo: [DataBaseImage]
    let description: String
    let category: [String]
    let price: Double
    let sizes: [String]
    let quantity: Int
    let collection, transactions2, creator, idFromCreator: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "ID Produit"
        case name, photo, description, category, price, sizes, quantity, collection
        case transactions2 = "Transactions 2"
        case creator = "Creator"
        case idFromCreator = "id (from Creator)"
    }
}
