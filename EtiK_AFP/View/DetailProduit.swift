//
//  DetailProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct DetailProduit: View {
    
    @State var articleTitle:String
    @State var articleDesc:String
    
    var body: some View {
        
        Text(articleTitle)
            .font(.custom("Italiana", size: 30))
        
        ScrollView {
            
            VStack {
                VStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.beige)
                            .frame(height: 300)
                        Image("lin")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .padding(.bottom, 50)
                    }
                    
                        HStack {
                            PiluleLabel(label: "🐼")
                            PiluleLabel(label: "🇫🇷")
                            PiluleLabel(label: "🌸")
                            PiluleLabel(label: "🤲🏻")
                    }
                    
                }.padding(.horizontal)
                
                
                
                Text(articleDesc)
                    .font(.custom("LibreFranklin", size: 15))
                    .foregroundStyle(.gray)
                    .padding()
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text("Tailles")
                    Picker(selection: .constant(1), label: Text("Picker")) {
                        Text("XS").tag(1)
                        Text("S").tag(2)
                        Text("M").tag(3)
                    }
                    
                    
                }
            }
        }
        
        LargeButton(labelButton: "Ajouter au panier")
    }
}

#Preview {
    DetailProduit(articleTitle: "Chemise en lin", articleDesc: "Découvrez notre chemise en lin vegan, fabriquée en France. Confectionnée à partir de lin durable et respectueux de l'environnement, elle est légère, respirante et confortable. Sa coupe élégante ajoute une touche de style à votre tenue. Chaque chemise est fabriquée avec une grande attention aux détails par des artisans français. Opter pour cette chemise, c'est choisir la mode éthique et soutenir l'artisanat local, tout en restant élégant et soucieux de l'environnement.")
}
