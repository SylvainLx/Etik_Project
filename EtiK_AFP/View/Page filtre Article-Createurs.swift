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
    let data: [String] = (1...2).map { "Élément \($0)" }
    let columns = [
        GridItem(.flexible(),spacing: 0),
        GridItem(.flexible(),spacing: 0)
    ]
    
    @State private var filteredProduits: [String] = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grapes"]
    @State private var filteredCreateurs: [String] = ["Pomme", "Banane", "Cerise", "Date", "Figue", "Raisin"]
    
    
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
                            .font(.headline)
                            .padding(10)
                            .background(Color.white)
                            .foregroundColor(.black)
                        
                    }
                    .border(Color.black, width: 2)
                }
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 0) {
                        ForEach(data, id: \.self) { item in
                            ZStack{
                                Rectangle()
                                    .frame(height: 620)
                                    .background()
                                    .opacity(0)
                                VStack {
                                    
                                    if let message = message {

                                        if message == "Produits" {
                                            List(filteredProduits.filter {
                                                searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
                                            }, id: \.self) { item in
                                                
                                                
                                                
                                                Text(item)
                                            }
                                        } else if message == "Créateurs" {
                                            
                                            List(filteredCreateurs.filter {
                                                searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
                                            }, id: \.self) { item in
                                                Text(item)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Veuillez saisir votre recherche ici")
        }
    }
}
    #Preview {
        Page_filtre_Article_Createurs();
    }

