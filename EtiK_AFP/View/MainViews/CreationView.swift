//
//  CreationView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CreationView: View {
    
    @State private var currentPage = 0
    let numberOfPages = 3
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button{
                    
                } label: {
                    Image(systemName: "paperplane")
                        .font(.custom("Italianno", size: 20))
                }.foregroundColor(.black)
                 
                Spacer()
                
                Text("Créations  ")
                    .font(.custom("Italianno", size: 50))
                    .padding(.leading, 2)
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "bell")
                        .font(.custom("Italianno", size: 20))
                }.foregroundColor(.black)
                
                
            }.padding(.horizontal)
                .padding(.vertical, -10)
            
            ScrollView(showsIndicators: false) {
                
                ZStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Thématique")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -1)
                            .padding(.horizontal)
                        
                        
                        ScrollViewReader { proxy in
                            ScrollView(.horizontal) {
                                HStack(spacing: 0) {
                                    ForEach(0..<numberOfPages, id: \.self) { page in
                                        CardThematique()
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
                                CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                                CardCollection()
                                CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                                CardCollection()
                                CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                                CardCollection()
                                CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                                CardCollection()
                            }.padding()
                        }
                        
                        Text("Créateurs")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -1)
                            .padding(.horizontal)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(1...20, id: \.self) { _ in
                                    SmallCreator(img: "creatrice")
                                        .scrollTransition(.animated) { content, phase in
                                            content
                                                .opacity(phase.isIdentity ? 1 : 0)
                                                .scaleEffect(phase.isIdentity ? 1 : 0.5)
                                        }
                                }
                            }.scrollTargetLayout()
                                .padding(.horizontal)
                        }.scrollTargetBehavior(.viewAligned)
                        
                        Text("Catégories")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -1)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                CardCategorie(categorie: "Vegan", image: "leaf")
                                CardCategorie(categorie: "Made in France", image: "flag")
                                CardCategorie(categorie: "Fait main", image: "hand.raised")
                                CardCategorie(categorie: "Biologique", image: "cloud")
                                CardCategorie(categorie: "Upcycling", image: "arrow.3.trianglepath")
                            }.scrollTargetLayout()
                                .padding(.horizontal)
                        }.scrollTargetBehavior(.viewAligned)
                         
                    }
                }
            }
        }
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
}
