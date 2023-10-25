//
//  PanierView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PanierView: View {
    
    @State var vide:Bool
    @State var price:Double = 200
    @State var frais:Double = 2.99
    @State var articles:[Article]
    
    var body: some View {
        VStack {
            
            Text("Panier")
                .font(.custom("Italianno", size: 50))
                .padding(.vertical, -10)
            
            if vide {
                
                Image("kraft")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("Oops, il n'y a rien dans ton panier ! ")
                    .font(.custom("Italiana", size: 20))
                Spacer()
                LargeButton(labelButton: "Retour aux créations")
                
            } else {
                
                VStack {
                    
                    List {
                        ForEach(articles) { article in
                                ArticlePanierCard(article: article)
                            } .onDelete(perform: deleteArticle)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(PlainListStyle())
                        
                    let totalPrice: Double = articles.reduce(0) { $0 + $1.price }

                    HStack {
                        
                        VStack(alignment: .trailing) {
                            Text("Sous total : ")
                            Text("Frais de port : ")
                            Text("Total : ")
                        }
                        
                        VStack(alignment: .trailing) {
                            Text("\(totalPrice, specifier: "%.2f") €")
                            Text("\(totalPrice == 0 ? 0 : frais, specifier: "%.2f") €")
                            Text("\(totalPrice == 0 ? 0 : frais + totalPrice, specifier: "%.2f") €")
                        }
                        .fontWeight(.bold)
                        
                    }.padding(.horizontal)
                    // .font(.custom("LibreFranklin", size: 14))
                    LargeButton(labelButton: "Paiement")
                        .padding()
                    
                }
            }
        }
    }
    
    func deleteArticle(at offsets: IndexSet) {
            articles.remove(atOffsets: offsets)
        }
    
}

#Preview {
    PanierView(vide: false, articles: articles)
}
