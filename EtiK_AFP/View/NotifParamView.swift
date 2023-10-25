//
//  NotifParamView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 23/10/2023.
//

import SwiftUI

struct NotifParamView: View {
    
    @State private var newCreator: Bool = false
    @State private var newProduct: Bool = true
    @State private var commandFollow: Bool = false
    @State private var eventFollow: Bool = true

    var body: some View {
        
        VStack { 
            TitleCard(title: "Paramètres de notifications")
               
            VStack(spacing: 32) {
                Toggle(isOn: $newCreator) {
                    Text("Nouveau Créateur")
                       
                }
                Toggle(isOn: $newProduct) {
                    Text("Nouveau produit d'un créateur suivi")
                        
                }
                Toggle(isOn: $commandFollow) {
                    Text("Suivis de commande")
                       
                }
                Toggle(isOn: $eventFollow) {
                    Text("Evènements à venir")
                }
            }.toggleStyle(SwitchToggleStyle(tint: Color.marron))
                .font(.custom("Italiana", size: 20))

            Spacer()
        }.padding()
    }
}

#Preview {
    NotifParamView()
}
