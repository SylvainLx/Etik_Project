//
//  ParametreView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 23/10/2023.
//

import SwiftUI

struct ParametreView: View {
    
    var body: some View {
        
        NavigationStack{
            List{
                
                    NavigationLink("Général", destination: ModifCompteView())
                
                Button{
                    
                }label: {
                    Text("Sécurité et privacy")
                }
                Button{
                    
                }label: {
                    Text("Activités")
                }
                Button{
                    
                }label: {
                    Text("Commande et Paiment")
                }
                Button{
                    
                }label: {
                    Text("Vérification")
                }
                Button{
                    
                }label: {
                    Text("Support")
                }
                Button{
                    
                }label: {
                    Text("Affichage")
                }
                Button{
                    
                }label: {
                    Text("Information mise à jour")
                }
                
                Button{
                    
                }label: {
                    Text("A propos")
                }
            }
            .navigationTitle("Paramètre")
        }
    }
}

#Preview {
    ParametreView()
}
