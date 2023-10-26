//
//  CardProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CardProduit: View {
    
    @State var titre:String = ""
    @State var prix:Double = 0.0
    @State var photo:String = ""
    @State var category:String = ""
    @State var type:String = ""
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    SmallCard()
                        .foregroundColor(.beige)
                    
                    Text("\(prix, specifier: "%.2f") €")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Image(photo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.bottom, 30)
                        .shadow(radius: 5)
                }
                
                Text(titre)
                    .font(.custom("Italiana", size: 20))
                Text(category + " / " + type)
                    .font(.custom("LibreFranklin", size: 10))
                    .foregroundStyle(.gray)
            }
            
            LikeButton() 
        }
        
    }
}

#Preview {
    CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
}
