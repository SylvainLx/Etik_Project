//
//  FavorisView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct FavorisView: View {
    
    @EnvironmentObject var productRequest: ProductsAPIRequest
    //    @State var produit: Product
    
    var body: some View {
        
        NavigationStack {
            
            Text("Favoris  ")
                .font(.custom("Italianno", size: 50))
                .padding(.leading, 2)
                .padding(.vertical, -10)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(productRequest.allProducts) { product in
                        ForEach(productRequest.allProducts) { product in
                            NavigationLink(destination: DetailProduit(produit: product)) {
                                CardProduit(produit: product)
                                    .scrollTransition(.animated) { content, phase in
                                        content
                                            .opacity(phase.isIdentity ? 1 : 0.5)
                                    }
                            } .navigationTitle("")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                        
                    }
                }
                .padding()
            }
        }.accentColor(.marron)
    }
}

#Preview {
    FavorisView()
        .environmentObject(ProductsAPIRequest())
}
