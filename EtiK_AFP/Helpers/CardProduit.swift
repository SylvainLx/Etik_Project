//
//  CardProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CardProduit: View {
    
    @State var produit: Product
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    SmallCard()
                        .foregroundColor(.beige)
                    
                    Text("\(produit.price, specifier: "%.2f") €")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                     
                    AsyncImage(url: URL(string: produit.photo[0].url)) { phase in
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
                
                Text(produit.name)
                    .font(.custom("Italiana", size: 12))
                Text(produit.category[0])
                    .font(.custom("LibreFranklin", size: 8))
                    .foregroundStyle(.gray)
            }
            
            LikeButton() 
        }
        
    }
}

//#Preview {
//    CardProduit(titre: "Chemise en lin", prix: 80, photo: "https://v5.airtableusercontent.com/v2/22/22/1698314400000/QH6aZEiQyKzT00jpofogcg/CfmxWHy_jhQz2WrE-V6Jjia2Qt5-6y7R_0FUoIinc4rDc7qrhjmspKvzPvUpCyuVqo5D6D0qifdkVpdYy7k7VZd0G3oFvPLGj1XQr0CWKlcEF3kqa6XNBEcfpQtGwD_IvSFCE9V860xWmzVxroRXYQ/bxiNyeMboC40iDCq5YEZpFSNJuEq-vrlrrK6yw-N7hA", category: "Made in France", type: "Vegan")
//}
