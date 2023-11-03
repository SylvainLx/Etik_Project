//
//  ArticleModel.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import Foundation

struct Article: Identifiable {
    var id = UUID()
    var name: String
    var photo: [DataBaseImage]
    var category: String
    var collection: String
    var price: Double
    var productSize: String
}

var articles = [
    Article(name: "Chemise en Lin", photo: [], category: "Made in France", collection: "Vegan", price: 100, productSize: "XS")
]


class Panier: ObservableObject {
    @Published var Panier: [Article]
    init() {
        self.Panier = [
           ]
    }
}
