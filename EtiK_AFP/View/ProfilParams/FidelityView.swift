//
//  FidelityView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 27/10/2023.
//

import SwiftUI

struct FidelityView: View {
    
   
    var body: some View {
        // Carte de fidélité
        VStack(spacing: 45) {
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 100, height: 3)
                .foregroundColor(.marron)
            
            FidelityCard()
            
            List {
                HStack {
                    Image(systemName: "checkmark.circle")
                    VStack(alignment: .leading) {
                        Text("32 points gagnés")
                        Text("Achat")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("T-shirt en lin bio")
                            .font(.caption)
                    }
                    
                }
                HStack {
                    Image(systemName: "checkmark.circle")
                    VStack(alignment: .leading) {
                        Text("20 points gagnés")
                        Text("Commentaire")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Evaluation du créateur : Chloé Scwarz")
                            .font(.caption)
                    }
                    
                }
                HStack {
                    Image(systemName: "checkmark.circle")
                    VStack(alignment: .leading) {
                        Text("20 points gagnés")
                        Text("Inscription")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Inscription à la newsletter")
                            .font(.caption)
                    }
                    
                }
                
                
            }.scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
                .padding()
                .font(.custom("Libre Franklin", size: 20))
            
        }.padding(.vertical)
        
    }
}

#Preview {
    FidelityView()
}
