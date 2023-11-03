//
//  CreatorDetailView.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct CreatorDetailView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel
    @State var createur : Creator
    
    
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
                        AsyncImage(url: URL(string: createur.picture[0].url)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                            } else if phase.error != nil {
                                Text("No Image")
                            } else {
                                ProgressView()
                            }
                            
                        }
                        .clipShape(Circle())
                        .frame(width: 80)
                    }
                    VStack {
                        Text(createur.firstName)
                        Text(createur.lastName)
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
                    Text(createur.biography)
                        .font(.custom("Libre Franklin", size: 16))
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Text("Mes Collections")
                            .font(.custom("Italianno", size: 30))
                            .padding(.top)
                            .padding(.bottom, -10)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    ScrollView(.horizontal) {
                        HStack {
                            NavigationLink(destination: CatalogueView(filtre: creatorId)) {
                                ForEach(dataFilter.productsRequest.allProducts) { product in
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
                            .padding(.top)
                            .padding(.bottom, -10)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(dataFilter.productsRequest.allProducts) { product in
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
                dataFilter.productsRequest.allProducts = await dataFilter.productsRequest.fetchedProducts()
            }
        }
    }
}


//#Preview {
//    CreatorDetailView()
//        .environmentObject(DataFilterModel())
//}
