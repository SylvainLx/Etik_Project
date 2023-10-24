//
//  ArticlePanierCard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct ArticlePanierCard: View {
    
    @State var article:Article
    
    var body: some View {
         
        HStack (spacing: 16) {
            
            ZStack(alignment: .bottom) {
                
                SmallCard()
                    .foregroundColor(.beige)
                Image("lin")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.bottom)
                    .shadow(radius: 5)
            }
           
            VStack(alignment: .leading) {
                Text(article.name)
                    .fontWeight(.bold)
                Text("\(article.category) / \(article.type)")
                    .font(.footnote)
                Text("\(article.price, specifier: "%.2f") €")
                    .fontWeight(.bold)
            }.padding(.top, 8)
            
            VStack {
                Text("Taille")
                    .fontWeight(.bold)
                Text(article.productSize)
            }
            
        }
    }
}

#Preview {
    ArticlePanierCard(article: Article(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, productSize: "XS"))
}
