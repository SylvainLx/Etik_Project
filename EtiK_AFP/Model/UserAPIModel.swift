// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - UserRequest
struct UserRequest: Codable {
    let records: [UserRecord]
  //  let offset: String
}

// MARK: - UserRecord
struct UserRecord: Codable {
    let id, createdTime: String
    let fields: User
}

// MARK: - User
struct User: Codable, Identifiable {
    let firstName: String
    let avatar: [DataBaseImage]
    let id, lastName, email, phone: String
    let adress: String
    let postalCode: Int
    let city, password: String
    let transactions: [String]

    enum CodingKeys: String, CodingKey {
        case firstName, avatar, id, lastName, email, phone, adress, postalCode, city, password
        case transactions = "Transactions"
    }
}
