// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CreatorWelcome: Codable {
    let id, createdTime: String
    let fields: CreatorFields
}

// MARK: - Fields
struct CreatorFields: Codable {
    let id, firstName, lastName, society: String
    let picture: [DataBaseImage]
    let email, password, role, biography: String
    let vegan, bio, madeInFrance, handMade: String
    let natural, upcycling, ville, adress: String
    let postalCode: String
    let events, products: [String]
    let transactions: String

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, society, picture, email, password, role, biography, vegan, bio
        case madeInFrance = "made in france"
        case handMade = "hand made"
        case natural, upcycling
        case ville = "Ville"
        case adress, postalCode
        case events = "Events"
        case products = "Products"
        case transactions = "Transactions"
    }
}
