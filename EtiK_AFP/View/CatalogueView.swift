//
//  CatalogueView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CatalogueView: View {
    
    @EnvironmentObject var productRequest: ProductsAPIRequest

    
    var body: some View {
        
        
        Text("Catalogue  ")
            .font(.custom("Italianno", size: 50))
            .padding(.vertical, -10)
            .padding(.leading, 2) 
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                ForEach(productRequest.allProducts) { product in
//                    NavigationLink(destination: DetailProduit()) {
//                        CardProduit(titre: product.name, prix: product.price, photo: product.photo[0].url, category: product.category[0], type: product.collection[0])
//                            .foregroundColor(.black)
//                    }
//                        .navigationTitle("")  // Cacher le titre de la navigation bar
//                        .navigationBarTitleDisplayMode(.inline)
                        
                        
                }
            }
        }
        .padding()
    }
}

#Preview {
    CatalogueView()
        .environmentObject(ProductsAPIRequest())
}
