//
//  CatalogueView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CatalogueView: View {
    
    @EnvironmentObject var productRequest: ProductsAPIRequest
    var filtre:String?
    
    var body: some View {
        
        
        TitleCard(title: "Catalogue  ")
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                ForEach(productRequest.allProducts) { product in
                    
                    if product.category[0] == filtre {
                        NavigationLink(destination: DetailProduit(produit: product)) {
                            CardProduit(produit: product)
                        }.navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline) 
                        
                    } else if product.idFromCreator[0] == filtre {
                        NavigationLink(destination: DetailProduit(produit: product)) {
                            CardProduit(produit: product)
                        }.navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                        
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CatalogueView(filtre: "Vegan")
        .environmentObject(ProductsAPIRequest())
}
