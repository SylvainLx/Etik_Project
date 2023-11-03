//
//  CreationView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CreationView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel

    @State private var search = ""
    @State private var currentPage = 0
    let numberOfPages = 3
    
    let cards: [AnyView] = [AnyView(Thematiquecard()), AnyView(Thematiquecard2()), AnyView(Thematiquecard3())]
    
    @State var searchText = ""
    var body: some View {
        
        NavigationStack {
            VStack {
                
                HStack {
                    
                    NavigationLink(destination: Chatbase()) {
                                           Image(systemName: "paperplane")
                                               .font(.custom("Italianno", size: 20))
                                       }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("Créations  ")
                        .font(.custom("Italianno", size: 50))
                        .padding(.leading, 2)
                    
                    Spacer()
                    
                    NavigationLink(destination: NotificationView()) {
                                            Image(systemName: "bell")
                                                .font(.custom("Italianno", size: 20))
                                        }.foregroundColor(.black)
                    
                    
                }.padding(.horizontal)
                    .padding(.vertical, -10)
                
                NavigationLink(destination: Page_filtre_Article_Createurs()) {
                    ZStack {
                        Rectangle()
                        .cornerRadius(10)
                        .frame(width: 370, height: 30)
                        .foregroundColor(Color(.sRGB, red: 0.7, green: 0.7, blue: 0.7, opacity: 0.3))
                        HStack {
                            Text("Rechercher")
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                        }.padding(.horizontal, 30)
                    }
                    .navigationTitle("")
                        .navigationBarTitleDisplayMode(.inline)
                }

                
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            
                            Text("Créateurs")
                                .font(.custom("Italianno", size: 30))
                                .padding(.vertical, -1)
                                .padding(.horizontal)
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(dataFilter.creatorRequest.allCreator) { createur in
                                        SmallCreator(creator: createur)
                                            .scrollTransition(.animated) { content, phase in
                                                content
                                                    .opacity(phase.isIdentity ? 1 : 0)
                                                    .scaleEffect(phase.isIdentity ? 1 : 0.5)
                                            }
                                    }
                                }
                                    .scrollTargetLayout()
                                    .padding(.horizontal)
                            }
                            .scrollTargetBehavior(.viewAligned)
                            
                            
                            Text("Thématiques")
                                .font(.custom("Italianno", size: 30))
                                .padding(.bottom, -1)
                                .padding(.horizontal)
                            
                            
                            ScrollViewReader { proxy in
                                ScrollView(.horizontal) {
                                    HStack() {
                                        ForEach(0..<numberOfPages, id: \.self) { index in
                                            cards[index]
                                                .frame(width: UIScreen.main.bounds.width, height: 150)
                                        }
                                    }
                                    .onChange(of: currentPage) { newPage in
                                        withAnimation {
                                            proxy.scrollTo(newPage)
                                        }
                                    }
                                }
                                .onAppear {
                                    startAutoScrollTimer()
                                }
                            }
                            
                        }
                    }
                    
                    HStack {
                        Circle().frame(width: currentPage == 0 ? 8 : 5)
                            .foregroundColor(currentPage == 0 ? .darkBeige : .beige)
                        Circle().frame(width: currentPage == 1 ? 8 : 5)
                            .foregroundColor(currentPage == 1 ? .darkBeige : .beige)
                        Circle().frame(width: currentPage == 2 ? 8 : 5)
                            .foregroundColor(currentPage == 2 ? .darkBeige : .beige)
                    }
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Top créations")
                                .font(.custom("Italianno", size: 30))
                                .padding(.bottom, -20)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    
                                    ForEach(dataFilter.productsRequest.allProducts) { product in
                                        NavigationLink(destination: DetailProduit(produit: product)) {
                                            CardProduit(produit: product)
                                                .foregroundColor(.black)
                                                .scrollTransition(.animated) { content, phase in
                                                    content
                                                        .opacity(phase.isIdentity ? 1 : 0.5)
                                                }
                                        }
                                        .navigationTitle("")
                                        .navigationBarTitleDisplayMode(.inline)
                                    }
                                    
                                }.scrollTargetLayout()
                                    .padding()
                            }.scrollTargetBehavior(.viewAligned)
                            
                            Text("Catégories")
                                .font(.custom("Italianno", size: 30))
                                .padding(.vertical, -1)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    NavigationLink(destination: CatalogueView(filtre: "Vegan")) {
                                        CardCategorie(categorie: "Vegan", image: "leaf")
                                    }
                                    NavigationLink(destination: CatalogueView(filtre: "Made in France")) {
                                        CardCategorie(categorie: "Made in France", image: "flag")
                                    }
                                    NavigationLink(destination: CatalogueView(filtre: "Fait main")) {
                                        CardCategorie(categorie: "Fait main", image: "hand.raised")
                                    }
                                    NavigationLink(destination: CatalogueView(filtre: "Biologique")) {
                                        CardCategorie(categorie: "Biologique", image: "cloud")
                                    }
                                    NavigationLink(destination: CatalogueView(filtre: "Upcycling")) {
                                        CardCategorie(categorie: "Upcycling", image: "arrow.3.trianglepath")
                                    }
                                    NavigationLink(destination: CatalogueView(filtre: "Naturel")) {
                                        CardCategorie(categorie: "Naturel", image: "tree")
                                    }
                                }
                                .foregroundColor(.black)
                                .scrollTargetLayout()
                                .padding(.horizontal)
                            }
                            .scrollTargetBehavior(.viewAligned)
                        }
                    }
                }
            }
        }
//        .onAppear {
//            Task {
//                productRequest.allProducts = await productRequest.fetchedProducts()
//            }
//        }
        
        
    }
    
    func startAutoScrollTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            withAnimation {
                currentPage = (currentPage + 1) % numberOfPages
            }
        }
    }
}

#Preview {
    
    CreationView()
        .environmentObject(DataFilterModel())
    
}
