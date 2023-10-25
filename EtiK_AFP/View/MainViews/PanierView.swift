//
//  PanierView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PanierView: View {
    
    @State var vide: Bool
    @State var price: Double = 200
    @State var frais: Double = 2.99
    @State var articles: [Article]
    @State var codePromo: String = ""
    @State var reductionApplied: Bool = false
    
    var body: some View {
        VStack {
            
            Text("Panier  ")
                .font(.custom("Italianno", size: 50))
                .padding(.vertical, -10)
                .padding(.leading, 2)
            
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
                    
                    var totalPrice: Double = articles.reduce(0) { $0 + $1.price }
                    
                    HStack {
                        
                        TextFieldProfil(title: "Code Promo", valeur: $codePromo)
                        
                        Button {
                            if codePromo == "promo30" {
                                reductionApplied = true
                            }
                        } label: {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.beige)
                                .font(.system(size: 40))
                        }
                        
                    }.padding(.horizontal)
                    
                    HStack {
                         
                        VStack(alignment: .trailing) {
                            Text("Sous total : ")
                            Text("Frais de port : ")
                            Text("Total : ")
                        }
                        
                        VStack(alignment: .trailing) {
                            Text("\(totalPrice - (reductionApplied ? totalPrice * 0.30 : 0), specifier: "%.2f") €")
                            Text("\(totalPrice == 0 ? 0 : frais, specifier: "%.2f") €")
                            Text("\(totalPrice == 0 ? 0 : frais + totalPrice - (reductionApplied ? totalPrice * 0.30 : 0), specifier: "%.2f") €")
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

