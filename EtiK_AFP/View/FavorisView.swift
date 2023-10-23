//
//  FavorisView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct FavorisView: View {
    
    var body: some View {
        NavigationStack {
            
            
            Text("Favoris")
                .font(.custom("Italianno", size: 50))
                .padding(.vertical, -10)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(1...7, id: \.self) { _ in
                        NavigationLink(destination: DetailProduit()) {
                            CardProduit()
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    FavorisView()
}
