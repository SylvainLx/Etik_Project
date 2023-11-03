//
//  AvisView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct AvisView: View {
    var body: some View {
        
        VStack {
            
            Text("Avis")
                .font(.custom("Italianno", size: 50))
                .padding(.vertical, -10)
            
            ScrollView {
                
                AvisCard(photo: "creatrice", name: "Berenice Whiter", commentaire: "Produit conforme a la description, je recommande cet article. Livré a temps et bien emballé. conforme a la description, je recommande cet article. Livré a temps et bien emballé.", heure: "Il y a 5 heures", note: 3.2)
                
                AvisCard(photo: "user1", name: "Chloé Schwartz", commentaire: "Au top !!", heure: "Hier", note: 4)
                
                AvisCard(photo: "user2", name: "Sklerenn", commentaire: "La robe est de bonne qualité, j'adore !", heure: "Hier", note: 3)
                
                AvisCard(photo: "user3", name: "Mathéo", commentaire: "Deuxième fois que je commande chez cette créatrice, les vêtements sont originaux et éthiques, je recommande vivement", heure: "Lundi", note: 4.7)
                
                AvisCard(photo: "user2", name: "Mia", commentaire: "Bien, livraison rapide, articles super beaux, merci !", heure: "Dimanche", note: 3.5)
                
                AvisCard(photo: "user3", name: "Gwenaelle", commentaire: "All good, dankjewel", heure: "Samedi", note: 2)
                
                
                AvisCard(photo: "user1", name: "Erwana", commentaire: "J'ai offert le collier à ma mère pour son anniversaire, je ne l'ai jamais vu aussi contente! Je recommande !", heure: "Jeudi", note: 5)
                
                AvisCard(photo: "creatrice", name: "Youen", commentaire: "Bien", heure: "Samedi", note: 2)
                
                
                AvisCard(photo: "user1", name: "Jude", commentaire: "So so so happy, i loooove it", heure: "15/10", note: 5)
                
                AvisCard(photo: "user3", name: "Katell", commentaire: "Je recommande ++", heure: "14/10", note: 5)
                
            }
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    AvisView()
}
