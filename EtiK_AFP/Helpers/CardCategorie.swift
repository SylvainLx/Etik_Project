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
                    .resizable()
                    .frame(width: 35, height: 25)
                    .foregroundColor(.white)
            }
            
            Text(categorie)
                .font(.custom("Italiana", size: 15))
                .frame(width: 70, height: 36)
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    HStack {
        CardCategorie(categorie: "Made in france", image: "leaf")
        CardCategorie(categorie: "Biologique", image: "cloud")
    }
    
}
