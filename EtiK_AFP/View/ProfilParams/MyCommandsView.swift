//
//  MyCommandsView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 23/10/2023.
//

import SwiftUI

struct MyCommandsView: View {
    
    @EnvironmentObject var data: TransactionObservable

    
    var body: some View {
        NavigationStack {
            
            VStack {
               TitleCard(title: "Mes commandes")
                ScrollView {
                    NavigationLink(destination: CommandDetailView(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")) {
                        CommandReturnCard(name:"Chemise", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")
                    }.foregroundColor(.black)
                    NavigationLink(destination: CommandDetailView(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")) {
                        CommandReturnCard(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 200, statut: "En cours de livraison...")
                    }.foregroundColor(.black)
                    Text(data.transaction.products[0])
                  //  Text(data.transaction.creator[0])
                }
                .padding(8)
                
            }
            Spacer()
        } .navigationBarTitleDisplayMode(.inline) 
            .environmentObject(data)
    }
}

#Preview {
    MyCommandsView()
        .environmentObject(TransactionAPIRequest())
        .environmentObject(UserAPIRequest())
        .environmentObject(UserObservable(user: User(firstName: "", avatar: [DataBaseImage](), id: "", lastName: "", email: "", phone: "", adress: "", postalCode: 0, city: "", password: "", transactions: [String]())))
}
