//
//  PanierView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PanierView: View {
    
    @State var vide:Bool
    
    var body: some View {
        VStack {
            
            Text("Panier")
                .font(.custom("Italianno", size: 50))
                .padding(.vertical, -10)
           Divider()
            
            if vide {
                Image("shirt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("Oops, il n'y a rien dans ton panier ! ")
                    .font(.custom("Italiana", size: 20))
                
                LargeButton(labelButton: "Retour aux créations")
                Spacer()
            } else {
               Spacer()
               // Ajout des articles mis dans le panier
                
            }
            
            
        }
    }
}

#Preview {
    PanierView(vide: true)
}
