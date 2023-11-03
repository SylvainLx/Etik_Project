//
//  DetailProduit.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct DetailProduit: View {
    @EnvironmentObject var dataFilter: DataFilterModel
    
    @EnvironmentObject var panier:Panier
    
    @State var produit: Product
    
    @State private var selectedSize = "XS"
    @State private var showInfo: Bool = false
    @State private var selectedPiluleLabel: String?
    
    @State private var creator: Creator?
    
    var body: some View {
        
        VStack {
            
            TitleCard(title: produit.name)
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    ZStack(alignment: .top) {
                        
                        ZStack(alignment: .bottom) {
                            
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.beige)
                                .frame(width: 350, height: 300)
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 10) {
                                    ForEach(produit.photo) { photo in
                                        AsyncImage(url: URL(string: photo.url)) { phase in
                                            if let image = phase.image {
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                            } else if phase.error != nil {
                                                Text("No image")
                                            } else {
                                                ProgressView()
                                            }
                                            
                                        }
                                        .frame(width: 350, height: 250)
                                        .clipped()
                                        .cornerRadius(30)
                                        .padding(.bottom, 50)
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
                            
                            
                            Text("\(produit.price, specifier: "%.2f") €")
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
                                ForEach(produit.category, id: \.self) { category in
                                    PiluleLabel( labelText: category, selectedPiluleLabel: $selectedPiluleLabel)
                                }
                            }.frame(width: 400,alignment: .center)
                        }
                    }.padding(.top)
                    Divider().padding(.horizontal)
                    
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
                            ForEach(produit.sizes, id: \.self) {
                                Text($0)
                            }
                        }.accentColor(.white)
                    }
                    
                    if produit.quantity == 0 {
                        Text("Non disponible" )
                            .font(.custom("LibreFranklin", size: 12))
                    } else {
                        Text("\(produit.quantity) disponible(s)" )
                            .font(.custom("LibreFranklin", size: 12))
                    }
                }
                
                Divider().padding(.horizontal)
                
                
                
                VStack(alignment: .leading) {
                    if let creator = dataFilter.creatorRequest.allCreator.first(where: { $0.id == produit.idFromCreator[0] }) {
                        HStack {
                            Text("\(creator.firstName) \(creator.lastName)")
                                .font(.custom("Italiana", size: 25))
                            Spacer()
                            SmallCreator(creator: creator)
                        }
                    }
                   
                    
                    
                    Text(produit.description)
                        .font(.custom("LibreFranklin", size: 15))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    HStack {
                        Text("Voir des produits similaires")
                            .font(.custom("Italiana", size: 25))
                            .padding(.bottom)
                        Spacer()
                        NavigationLink (destination: CatalogueView(filtre: produit.category[0])) {
                            
                            Image(systemName: "chevron.forward.circle.fill")
                                .foregroundColor(.beige)
                                .font(.system(size: 30))
                            
                        }.padding(.bottom)
                            .padding(.trailing, 8)
                    }
                    
                }.padding(.horizontal)
                
            }
        }
        
        Button {
            panier.Panier.append(Article(name: produit.name, photo: produit.photo, category: produit.category[0], collection: "", price: produit.price, productSize: selectedSize))
            print("article ajouté")
            print(panier.Panier.count)
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.marron)
                    .frame(width: 300, height: 50)
                Text("Ajouter au panier")
                    .foregroundStyle(.white)
                    .font(.custom("Libre Franklin", size: 16))
            }
        }.padding(.bottom)
    }
    
}




//#Preview {
//
//    @StateObject var productRequest = ProductsAPIRequest()
//
//    Task {
//        do {
//            // Récupérez les produits à partir de l'API
//            let products = try await productRequest.fetchedProducts()
//
//            if let firstProduct = products.first {
//                print("OKOKOKOKOKOK") // Assurez-vous que les données sont disponibles
//            } else {
//                print("Aucun produit disponible")
//            }
//        } catch {
//            print("Erreur lors de la récupération des produits : \(error)")
//        }
//    }
//
//    // Utilisez le premier produit s'il est disponible
//    if let firstProduct = productRequest.allProducts.first {
//        return DetailProduit(produit: firstProduct)
//            .environmentObject(productRequest)
//
//    } else {
//        return Text("Aucun produit disponible")
//    }
//}

#Preview {
    
    let sampleProduct = Product(
        id: "1",
        name: "T shirt en Lin",
        photo: [],
        description: "Sample Description",
        category: ["Sample Category"],
        price: 10.0,
        sizes: ["XS", "S", "M", "L"],
        quantity: 5,
        collection: [],
        transactions2: [],
        creator: [],
        idFromCreator: [],
        url: ""
    )
    
    return DetailProduit(produit: sampleProduct)
        .environmentObject(DataFilterModel())
        .environmentObject(ProductsAPIRequest())
        .environmentObject(Panier())
}
