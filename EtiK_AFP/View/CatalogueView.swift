//
//  CatalogueView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CatalogueView: View {
    var body: some View {
        
        
        Text("Catalogue  ")
            .font(.custom("Italianno", size: 50))
            .padding(.vertical, -10)
            .padding(.leading, 2) 
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                ForEach(1...7, id: \.self) { _ in
                    CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin3", category: "Made in France", type: "Vegan")
                }
            }
        }
        .padding()
    }
}

#Preview {
    CatalogueView()
}
