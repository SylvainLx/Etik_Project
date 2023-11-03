// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - UserRequest
struct UserRequest: Codable {
    let records: [UserRecord]
}

// MARK: - UserRecord
struct UserRecord: Codable {
    let id, createdTime: String
    let fields: User
}

// MARK: - User
struct User: Codable, Identifiable {
    var firstName: String
    var avatar: [DataBaseImage]
    var id: String
    var lastName: String
    var email: String
    var phone: String
    var adress: String
    var postalCode: Int
    var city: String
    var password: String
    var transactions: [String]
    let role: String
    
    enum CodingKeys: String, CodingKey {
        case firstName, avatar, id, lastName, email, phone, adress, postalCode, city, password
        case transactions = "Transactions"
        case role
    }
}

class UserObservable: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
