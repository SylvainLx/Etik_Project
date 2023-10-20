//
//  CreationView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CreationView: View {
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "paperplane")
                    .font(.custom("Italianno", size: 20))
                Spacer()
                Text("Créations")
                    .font(.custom("Italianno", size: 50))
                Spacer()
                Image(systemName: "bell")
                    .font(.custom("Italianno", size: 20))
            }.padding(.horizontal)
                .padding(.vertical, -10)
            
            
            
            ScrollView {
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Thématique")
                        .font(.custom("Italianno", size: 30))
                    .padding(.vertical, -5)
                    .padding(.horizontal)
                
                
                ScrollView(.horizontal) {
                    HStack {
                        Rectangle()
                            .frame(width: 400, height: 150)
                        Rectangle()
                            .frame(width: 400, height: 150)
                        Rectangle()
                            .frame(width: 400, height: 150)
                        
                    }.scrollTransition(.animated) { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1 : 0.3)
                            .scaleEffect(phase.isIdentity ? 1 : 0.8)
                    }
                  }.scrollTargetBehavior(.viewAligned)
                }
                
                HStack {
                    Circle().frame(width: 10)
                    Circle().frame(width: 10)
                    Circle().frame(width: 10)
                }
                
                VStack {
                    
                    VStack(alignment: .leading) {
                        Divider()
                        Text("Créateurs")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -5)
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                Circle().frame(width: 100)
                                Circle().frame(width: 100)
                                Circle().frame(width: 100)
                                Circle().frame(width: 100)
                            }
                        }
                        Divider()
                        Text("Catégories")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -5)
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                CardCategorie(categorie: "Vegan", image: "pawprint")
                                CardCategorie(categorie: "Made in France", image: "flag")
                                CardCategorie(categorie: "Fait main", image: "hand.raised")
                                CardCategorie(categorie: "Biologique", image: "cloud")
                                CardCategorie(categorie: "Upcycling", image: "arrow.3.trianglepath")
                            }
                        }
                         
                        Divider()
                        
                        Text("Top 30")
                            .font(.custom("Italianno", size: 30))
                            .padding(.vertical, -5)
                        
                        
                        ScrollView(.horizontal) {
                            HStack {
                                CardProduit()
                                CardCollection()
                                CardCollection()
                            }
                        }
                    }.padding(.horizontal)
                    
                }
            }
        }
        
    }
}

#Preview {
    CreationView()
}
