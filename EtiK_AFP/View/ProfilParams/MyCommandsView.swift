//
//  MyCommandsView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 23/10/2023.
//

import SwiftUI

struct MyCommandsView: View {
    
    var body: some View {
        NavigationStack {
            
            VStack {
               TitleCard(title: "Mes commandes")
                ScrollView {
                    NavigationLink(destination: CommandDetailView(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")) {
                        CommandReturnCard(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")
                    }.foregroundColor(.black)
                    NavigationLink(destination: CommandDetailView(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")) {
                        CommandReturnCard(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 200, statut: "En cours de livraison...")
                    }.foregroundColor(.black)
                }
                .padding(8)
                
            }
            Spacer()
        } .navigationBarTitleDisplayMode(.inline) 
    }
}

#Preview {
    MyCommandsView()
}
