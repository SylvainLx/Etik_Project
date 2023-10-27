//
//  CardCollection.swift
//  EtiK
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CardCollection: View {
    
    @State var produit: Product
    
    var body: some View {
         
            VStack {
                 
                ZStack(alignment: .bottom) {
                    
                    SmallCard()
                        .foregroundColor(.darkBeige)
                    
                    Image("shirt")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.bottom, 30)
                        .shadow(radius: 5)
                }
                
                
                Text("Collection")
                    .font(.custom("Italiana", size: 20))
                Text(produit.collection[0])
                    .font(.custom("LibreFranklin", size: 8))
                    .foregroundStyle(.gray)
            }
         
    }
}

//#Preview {
//    CardCollection()
//}
