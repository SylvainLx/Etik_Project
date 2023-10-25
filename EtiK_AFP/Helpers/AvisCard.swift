//
//  Aviscard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct AvisCard: View {
    
    @State  var photo:String
    @State  var name:String
    @State  var commentaire:String
    @State  var heure:String
    @State  var note:Double
    
    var body: some View {
        
        
        Divider()
        
        
        HStack(alignment: .top) {
            
            Image(photo)
                .resizable()
                .frame(width: 60,height: 60)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.custom("Italianno", size: 40))
                        .padding(.vertical, -10)
                    Spacer()
                    Text("Il y a \(heure)")
                        .font(.system(size: 10))
                }
                
                HStack {
                    StarView(note: note)
                    Text("\(note, specifier: "%.1f")/5")
                        .font(.custom("LibreFranklin", size: 14))
                }
                
            }
            
        }.padding()
        
        VStack {
            Text(commentaire)
                .font(.custom("LibreFranklin", size: 12))
        }.padding(.horizontal)
        
    }
}

#Preview {
    AvisCard(photo: "creatrice", name: "Berangère", commentaire: "Produit conforme à la description. Je suis ravie de cet achat. Je recommande cette créatrice. Petit bémol sur le colis qui était mal emballé", heure: "5 min", note: 3.6)
}
