//
//  CardCategorie.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CardCategorie: View {
    
    @State var categorie:String
    @State var image:String
    
    var body: some View {
        VStack {
             
            ZStack {
                
                MiniCard()
                    .foregroundColor(.beige)
                
                Image(systemName: image)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                 
            }
            
            Text(categorie)
                .font(.custom("Italiana", size: 15))
            
        }
    }
}

#Preview {
    CardCategorie(categorie: "Vegan", image: "pawprint")
}
