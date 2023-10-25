// This file was generated from JSON Schema using quicktype, do not modify it directly.

import Foundation

// MARK: - Welcome
struct EventRequest: Codable {
    let records: [EventRecord]
}

// MARK: - Record
struct EventRecord: Codable {
    let id, createdTime: String
    let fields: Event
}

// MARK: - Event
struct Event: Codable {
    let id, name, description: String
    let picture: [DataBaseImage]
    let adress, ville, latitude, longitude: String
    let idCreateur: [String]
    let postalCode, participants, date: String
    let idFromIDCreateur: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, description, picture, adress, ville, latitude, longitude
        case idCreateur = "id createur"
        case postalCode, participants, date
        case idFromIDCreateur = "id (from id createur)"
    }
}
