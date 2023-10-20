//
//  CardProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CardProduit: View {
    
    @State var titre:String = "Chemise en lin"
    @State var prix:Double = 80
    
    var body: some View {
        
        NavigationStack {
           
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
                        
                        Image("lin")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .padding(.bottom, 30)
                            .shadow(radius: 5)
                    }
                 
                 
                Text(titre)
                    .font(.custom("Italiana", size: 20))
                Text("Vegan")
                    .font(.custom("LibreFranklin", size: 10))
                    .foregroundStyle(.gray)
            }
            
        }
    }
}

#Preview {
    CardProduit()
}
