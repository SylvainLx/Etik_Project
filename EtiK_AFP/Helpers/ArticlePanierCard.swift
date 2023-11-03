//
//  ArticlePanierCard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct ArticlePanierCard: View {
    
    @State var article:Article
    var showDetail:Bool
    
    
    var body: some View {
         
        HStack (spacing: 16) {
            
            ZStack(alignment: .bottom) {
                
                SmallCard()
                    .foregroundColor(.beige)
                
                AsyncImage(url: URL(string: article.photo[0].url)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("No Image")
                    } else {
                        ProgressView()
                    }
                    
                }
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(30)
                .padding(.bottom, 30)
            }
            
            if showDetail {
                VStack(alignment: .leading) {
                    Text(article.name)
                        .fontWeight(.bold)
                    Text("\(article.category) / \(article.collection)")
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
}

//#Preview {
//    ArticlePanierCard(article: Article(name: "Chemise en Lin", photo: ["http://image.png"], category: "Made in France", collection: "Vegan", price: 100, productSize: "XS"))
//}
