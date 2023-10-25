//
//  DetailProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct DetailProduit: View {
    
    
    @State var articleTitle:String = "Chemise en lin bio"
    @State var articleDesc:String = "Découvrez notre chemise en lin vegan, fabriquée en France. Confectionnée à partir de lin durable et respectueux de l'environnement, elle est légère, respirante et confortable. Sa coupe élégante ajoute une touche de style à votre tenue. Chaque chemise est fabriquée avec une grande attention aux détails par des artisans français. Opter pour cette chemise, c'est choisir la mode éthique et soutenir l'artisanat local, tout en restant élégant et soucieux de l'environnement."
    @State var articlePhoto = ["lin3", "lin1", "lin2"]
    @State var stock:Int = 2
    @State var prix:Double = 80.99
    
    var sizes = ["XS", "S", "M", "L", "XL", "XXL"]
    @State private var selectedSize = "XS"
    @State private var showInfo: Bool = false
    
    @State private var selectedPiluleLabel: String?
    
    var body: some View {
        
        VStack {
            
            TitleCard(title: "Chemise en lin bio")
            
            VStack {
                
                ZStack(alignment: .top) {
                    
                    ZStack(alignment: .bottom) {
                        
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.beige)
                            .frame(width: 350, height: 300)
                            
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 10) {
                                ForEach(articlePhoto, id: \.self) { photo in
                                    Image(photo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350)
                                        .padding(.bottom, 50)
                                        .shadow(radius: 2)
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
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                    }.frame(width: 350, height: 320)
                    
                    HStack {
                        ARButton().padding(.leading, 20)
                        Spacer()
                        LikeButton().padding(.trailing, 20)
                        
                    }.padding(.horizontal)
                        .padding(.top, 30)
                    
                }
              
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            PiluleLabel(label: "leaf", labelText: "Vegan", selectedPiluleLabel: $selectedPiluleLabel)
                            PiluleLabel(label: "flag", labelText: "Made in France", selectedPiluleLabel: $selectedPiluleLabel)
                            PiluleLabel(label: "cloud", labelText: "Biologique", selectedPiluleLabel: $selectedPiluleLabel)
                            PiluleLabel(label: "hand.raised", labelText: "Fait main", selectedPiluleLabel: $selectedPiluleLabel)
                        }.frame(width: 400,alignment: .center) 
                    }
                }
                Divider().padding()
                
            }
            
            
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
                
                if stock == 0 {
                    Text("Non disponible" )
                        .font(.custom("LibreFranklin", size: 12))
                } else {
                    Text("\(stock) disponible(s)" )
                        .font(.custom("LibreFranklin", size: 12))
                }
            }
             
            Divider().padding(.top)
            
            ScrollView(showsIndicators: false) {
                Text(articleDesc)
                    .font(.custom("LibreFranklin", size: 15))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
            }.padding()
        }
        
        
        LargeButton(labelButton: "Ajouter au panier")
    }
}

#Preview {
    DetailProduit()
}
