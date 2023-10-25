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
    var category: String
    var type: String
    var price: Double
    var productSize: String
}

var articles = [
    Article(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, productSize: "XS"),
    Article(name: "Chemise en coton bio", category: "Made in France", type: "Bio", price: 58.99, productSize: "S"),
    Article(name: "Chemise casual", category: "Made in France", type: "", price: 39.99, productSize: "XS")

]
