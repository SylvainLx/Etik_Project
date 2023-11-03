//
//  PanierView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PanierView: View {
    
    @EnvironmentObject var panier: Panier
    
    @Binding var tab:Int
    
    @State var price: Double = 200
    @State var frais: Double = 2.99
    @State var codePromo: String = ""
    @State var reductionApplied: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Panier  ")
                    .font(.custom("Italianno", size: 50))
                    .padding(.vertical, -10)
                    .padding(.leading, 2)
                
                if panier.Panier.isEmpty {
                    
                    Image("kraft")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    Text("Oops, il n'y a rien dans ton panier ! ")
                        .font(.custom("Italiana", size: 20))
                    Spacer()
                    Button(action: {
                        tab = 1 // Change l'onglet actif
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.marron)
                                .frame(width: 300, height: 50)
                            Text("Retour aux créations")
                                .foregroundColor(.white)
                                .font(.custom("Libre Franklin", size: 16))
                        }
                    }  .padding()

                } else {
                    
                    VStack {
                        
                        List {
                            ForEach(panier.Panier) { article in
                                ArticlePanierCard(article: article,showDetail: true)
                            } .onDelete(perform: deleteArticle)
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(PlainListStyle())
                        
                        let totalPrice: Double = panier.Panier.reduce(0) { $0 + $1.price }
                        
                        HStack {
                            
                            TextFieldProfil(title: "Code Promo", valeur: $codePromo)
                                .textInputAutocapitalization(.never)
                            
                            
                            Button {
                                if codePromo == "promo30" {
                                    reductionApplied = true
                                }
                            } label: {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.beige)
                                    .font(.system(size: 30))
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
                        LargeButton(labelButton: "Paiement", colorSelect: .marron, destination: AnyView(PayView()))
                            .padding()
                        
                    }
                }
            }
        }
    }
    
    func deleteArticle(at offsets: IndexSet) {
        panier.Panier.remove(atOffsets: offsets)
    }
    
}

#Preview {
    PanierView(tab: .constant(0))
}

