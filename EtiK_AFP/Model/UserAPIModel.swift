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
    let firstName: String
    let avatar: [DataBaseImage] = [DataBaseImage]()
    let id: String
    let lastName: String
    let email: String
    let phone: String
    let adress: String
    let postalCode: Int
    let city: String
    let password: String
    let transactions: [String] = [String]()

    enum CodingKeys: String, CodingKey {
        case firstName, avatar, id, lastName, email, phone, adress, postalCode, city, password
        case transactions = "Transactions"
    }
}

class UserObservable: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
