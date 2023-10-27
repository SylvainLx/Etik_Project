//
//  CreatorDetailView.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct CreatorDetailView: View {
    
    @EnvironmentObject var productRequest: ProductsAPIRequest
    
    @State var destination:AnyView?
    @State var creatorId = "912"
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack(alignment: .center, spacing: 26) {
                    ZStack {
                        Circle()
                            .stroke(.beige, lineWidth: 5)
                            .frame(width: 100, height:100)
                        Image("creatrice")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 80)
                    }
                    VStack {
                        Text("Chloé")
                        Text("Schwartz")
                    }.font(.custom("Italiana", size : 32))
                    VStack(spacing: 4) {
                        StarView(note: 4.6)
                        Text("4.6/5")
                        Text("(121 avis)")
                        NavigationLink(destination: AvisView()) {
                            Text("Voir les avis")
                        }.foregroundColor(.blue)
                    } .font(.caption)
                }
                HStack(spacing: 26) {
                    SmallButtonToggle()
                    SmallButtonDestination(title: "Contacter")
                    SmallButtonDestination(title: "Rencontrer")
                }
                ScrollView {
                    HStack {
                        
                        Text("Mon Histoire")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -1)
                        
                        Spacer()
                        NavigationLink(destination: destination) {
                            Text("En savoir plus")
                                .font(.system(size: 10))
                            
                        }.foregroundColor(.blue)
                    }.padding()
                    Text("Je m'appelle Chloé Schwarz, et j'ai toujours aimé la mode. Cependant, mon amour pour les animaux et l'environnement m'a poussé à devenir créatrice de vêtements vegan. J'ai cherché des matériaux alternatifs, comme le coton biologique et le lin, pour créer des pièces élégantes sans utiliser de produits d'origine animale. J'ai commencé modestement, en exposant mes créations sur des marchés locaux, mais au fil du temps, ma boutique vegan a prospéré...")
                        .font(.custom("LibreFranklin", size: 15))
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Text("Mes Collections")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -1)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    ScrollView(.horizontal) {
                        HStack {
                            NavigationLink(destination: CatalogueView(filtre: creatorId)) {
                                ForEach(productRequest.allProducts) { product in
                                    if product.idFromCreator.first == creatorId {
                                        CardCollection(produit: product)
                                    }
                                }
                            }.foregroundColor(.black)
                                .navigationTitle("")
                                .navigationBarTitleDisplayMode(.inline)
                             
                        }.padding()
                    }
                    
                    HStack {
                        Text("Mes Produits")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -1)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(productRequest.allProducts) { product in
                                if product.idFromCreator.first == creatorId {
                                    NavigationLink(destination: DetailProduit(produit: product)) {
                                        CardProduit(produit: product)
                                    }.navigationTitle("")
                                        .navigationBarTitleDisplayMode(.inline)
                                    
                                }
                            }
                            
                        }.scrollTargetLayout()
                            .padding()
                    }.scrollTargetBehavior(.viewAligned)
                    
                }
            }
        }.onAppear {
            Task {
                productRequest.allProducts = await productRequest.fetchedProducts() 
            }
        }
    }
}


#Preview {
    CreatorDetailView()
        .environmentObject(ProductsAPIRequest())
}
