//
//  DetailProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct DetailProduit: View {
    
    @State var articleTitle:String = "Chemise en lin"
    @State var articleDesc:String = "Découvrez notre chemise en lin vegan, fabriquée en France. Confectionnée à partir de lin durable et respectueux de l'environnement, elle est légère, respirante et confortable. Sa coupe élégante ajoute une touche de style à votre tenue. Chaque chemise est fabriquée avec une grande attention aux détails par des artisans français. Opter pour cette chemise, c'est choisir la mode éthique et soutenir l'artisanat local, tout en restant élégant et soucieux de l'environnement."
    @State var articlePhoto = ["lin", "shirt", "shirt2", "shirt3"]
    @State var stock:Int = 10
    @State var prix:Double = 80.99
    
    var sizes = ["XS", "S", "M", "L", "XL", "XXL"]
    @State private var selectedSize = "XS"
    
    var body: some View {
        
        VStack {
            Text(articleTitle)
                .font(.custom("Italianno", size: 80))
                .padding(10)
            
            VStack {
                
                ZStack(alignment: .bottom) {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.beige)
                        .frame(width: 350, height: 300)
 
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 10) {
                                ForEach(articlePhoto, id: \.self) { photo in
                                    Image(photo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350)
                                        .padding(.bottom, 50)
                                        .shadow(radius: 5)
                                        .containerRelativeFrame(.horizontal)
                                        .scrollTransition(.animated) { content, phase in
                                            content
                                                .opacity(phase.isIdentity ? 1 : 0.3)
                                                .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                                .rotation3DEffect(.radians(phase.value), axis: (1, 1, 1))
                                        }
                                    
                                }
                            }.scrollTargetLayout()
                        }.scrollTargetBehavior(.viewAligned)
 
                          
                        
                    Text("\(prix, specifier: "%.2f") €")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                }.frame(width: 350, height: 320)
                
                HStack {
                    PiluleLabel(label: "🐼")
                    PiluleLabel(label: "🇫🇷")
                    PiluleLabel(label: "🌸")
                    PiluleLabel(label: "🤲🏻")
                }.padding(.bottom)
                
            }.padding(.horizontal)
            
            
            HStack {
                Text("Tailles :")
                    .fontWeight(.bold)
                    .font(.custom("LibreFranklin", size: 20))
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 80, height: 30)
                        .foregroundColor(.marron)
                    Picker("Please choose a size", selection: $selectedSize) {
                        ForEach(sizes, id: \.self) {
                            Text($0)
                        }
                    }.accentColor(.white)
                }
                
            }
            
            if stock == 0 {
                Text("Non disponible" )
                    .font(.custom("LibreFranklin", size: 12))
            } else {
                Text("\(stock) disponible(s)" )
                    .font(.custom("LibreFranklin", size: 12))
            }
            
            ScrollView {
                Text(articleDesc)
                    .font(.custom("LibreFranklin", size: 15))
                    .foregroundStyle(.gray)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
        
        
        LargeButton(labelButton: "Ajouter au panier")
    }
}

#Preview {
    DetailProduit()
}
