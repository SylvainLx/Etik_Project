//
//  DataBaseImage.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

// MARK: - DataBaseImage
struct DataBaseImage: Codable {
    let id: String
    let width, height: Int
    let url: String
    let filename: String
    let size: Int
    let type: String
    let thumbnails: Thumbails
}

// MARK: - Thumbnails
struct Thumbails: Codable {
    let small, large, full: Full
}

// MARK: - Full
struct Full: Codable {
    let url: String
    let width, height: Int
}
