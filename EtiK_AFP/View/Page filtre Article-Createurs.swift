//
//  Page filtre Article-Createurs.swift
//  EtiK_AFP
//
//  Created by apprenant48 on 23/10/2023.
//

import SwiftUI

struct Page_filtre_Article_Createurs: View {
    @State private var message: String?
    @State private var searchText = ""
    
    @EnvironmentObject var dataFilter: DataFilterModel
    
    let columns1 = [
        GridItem(.flexible(),spacing: 0)
    ]
    
    let columns2 = [
        GridItem(.flexible(),spacing: 0),
        GridItem(.flexible(),spacing: 0)
    ]
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .center){
                
                HStack (spacing: -2){
                    
                    Button(action: {
                        message = "Produits"
                    }) {
                        Text("Produits")
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color.white)
                        
                            .foregroundColor(.black)
                    }
                    .border(Color.black, width: 2)
                    
                    Button(action: {
                        message = "Créateurs"
                    }) {
                        Text("Créateurs")
                            .frame(maxWidth: .infinity)
                        
                            .padding(10)
                            .background(Color.white)
                            .foregroundColor(.black)
                        
                    }
                    .border(Color.black, width: 2)
                }

                
                if let message = message {
                    if message == "Produits" {
                        
                        ScrollView {
                            LazyVGrid(columns: columns2,spacing: 10) {
                                
                                ForEach(dataFilter.productsRequest.allProducts.filter {
                                    searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
                                }, id: \.self) { produit in
                                    NavigationLink(destination: DetailProduit(produit: produit)) {
                                        CardProduit(produit: produit)
                                            .padding(.top, 20)
                                    }
                                }
                            }
                            
                        }}
                    else if message == "Créateurs" {
                        ScrollView {
                            LazyVGrid(columns: columns1,spacing: 20) {
                                    ForEach(dataFilter.creatorRequest.allCreator.filter {
                                        searchText.isEmpty ? true : $0.firstName.localizedCaseInsensitiveContains(searchText)
                                    }, id: \.self) { creator in
                                            CreateurFiltre(creator: creator)
                                                .padding(.top, 20)
                                        
                                    }
                                }
                        }
                    }
                }
                Spacer()
            }
            .searchable(text: $searchText, prompt: "Veuillez saisir votre recherche ici")
        }
    }
}
#Preview {
    Page_filtre_Article_Createurs()
        .environmentObject(DataFilterModel())
}
