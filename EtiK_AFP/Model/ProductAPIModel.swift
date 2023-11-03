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
struct Product: Codable, Identifiable, Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String
    var name: String
    var photo: [DataBaseImage]
    var description: String
    var category: [String]
    var price: Double
    var sizes: [String]
    var quantity: Int
    var collection, transactions2, creator, idFromCreator: [String]
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id produit"
        case name, photo, description, category, price, sizes, quantity, collection
        case transactions2 = "transactions 2"
        case creator = "creator"
        case idFromCreator = "id (from creator)"
        case url = "url"
    }
}

class TransactionToProducts: ObservableObject {
    @Published var transactionToProducts: [Product]
    
    init(transactionToProducts: [Product]) {
        self.transactionToProducts = transactionToProducts
    }
}
