//
//  CatalogueView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CatalogueView: View {
        
    @EnvironmentObject var dataFilter: DataFilterModel

    var filtre:String?
    
    var body: some View {
        
        
        TitleCard(title: "Catalogue  ")
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                ForEach(dataFilter.productsRequest.allProducts) { product in
                    
                    if product.category.first == filtre {
                        NavigationLink(destination: DetailProduit(produit: product)) {
                            CardProduit(produit: product)
                        }.navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                        
                    } else if product.idFromCreator.first == filtre {
                        NavigationLink(destination: DetailProduit(produit: product)) {
                            CardProduit(produit: product)
                        }
                            .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                        
                    } else if product.collection.first == filtre {
                        NavigationLink(destination: DetailProduit(produit: product)) {
                            CardProduit(produit: product)
                        }
                            .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline)
                        
                    }
                }.foregroundColor(.black)
            }
        }.onAppear {
            Task {
                dataFilter.productsRequest.allProducts = await dataFilter.productsRequest.fetchedProducts()
            }
        }
        .padding()
    }
}

#Preview {
    CatalogueView(filtre: "Vegan")
        .environmentObject(DataFilterModel())
}
