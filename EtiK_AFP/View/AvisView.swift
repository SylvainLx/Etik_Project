//
//  AvisView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct AvisView: View {
    var body: some View {
        
        VStack {
            
            Text("Avis")
                .font(.custom("Italianno", size: 50))
                .padding(.vertical, -10)
            
            ScrollView {
                ForEach(1...10, id: \.self) { _ in
                    AvisCard(photo: "creatrice", name: "Berenice", commentaire: "Produit conforme a la description, je recommande cet article. Livré a temps et bien emballé. conforme a la description, je recommande cet article. Livré a temps et bien emballé.", heure: "5h", note: 4.5)
                }
            }
            
        }
        
    }
}

#Preview {
    AvisView()
}
