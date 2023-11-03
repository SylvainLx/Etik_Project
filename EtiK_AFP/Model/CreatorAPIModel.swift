// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - Welcome
struct CreatorWelcome: Codable {
    let records: [Record]
}

// MARK: - Record
struct Record: Codable {
    let id, createdTime: String
    let fields: Creator
}

// MARK: - Creator
struct Creator: Codable, Identifiable, Hashable {
    static func == (lhs: Creator, rhs: Creator) -> Bool {
        lhs.firstName == rhs.firstName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id, firstName, lastName, society: String
    let picture: [DataBaseImage]
    let email, password, role, biography: String
      let vegan, bio, madeInFrance, handMade: String
      let natural, upcycling, ville, adress: String
      let postalCode, events, products, transactions: String
      let products2, transactions2, events2: [String]

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
          case products2 = "Products 2"
          case transactions2 = "Transactions 2"
          case events2 = "Events 2"
      }
}
