//
//  CreatorDetailView.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct CreatorDetailView: View {
    
    @State var destination:AnyView?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
           
            VStack {
                HStack(alignment: .center, spacing: 26) {
                    ZStack {
                        Circle()
                            .stroke(.beige, lineWidth: 5)
                            .frame(width: 100, height:100)
                        Image("creatrice")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    VStack {
                        Text("Chloé")
                        Text("Schwartz")
                    }.font(.custom("Italiana", size : 32))
                    VStack(spacing: 4) {
                        StarView(note: 4.6)
                        Text("4.6/5")
                        Text("(121 avis)")
                        NavigationLink(destination: destination) {
                            Text("Voir les avis")
                        }.foregroundColor(.blue)
                    } .font(.caption)
                }
                HStack(spacing: 26) {
                    SmallButtonToggle()
                    SmallButtonDestination(title: "Contacter")
                    SmallButtonDestination(title: "Rencontrer")
                }
                HStack {
                    Text("Mon Histoire")
                        .font(.custom("LibreFranklin", size: 18))
                    Spacer()
                    NavigationLink(destination: destination) {
                        Text("En savoir plus")
                            .font(.system(size: 10))
                        
                    }.foregroundColor(.blue)
                }.padding()
                Text("Je m'appelle Chloé Schwarz, et j'ai toujours aimé la mode. Cependant, mon amour pour les animaux et l'environnement m'a poussé à devenir créatrice de vêtements vegan. J'ai cherché des matériaux alternatifs, comme le coton biologique et le lin, pour créer des pièces élégantes sans utiliser de produits d'origine animale. J'ai commencé modestement, en exposant mes créations sur des marchés locaux, mais au fil du temps, ma boutique vegan a prospéré...")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .font(.custom("LibreFranklin", size: 10))
                HStack {
                    Text("Mes Collections")
                        .font(.custom("LibreFranklin", size: 18))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                ScrollView(.horizontal) {
                    HStack {
                        CardCollection()
                        CardCollection()
                        CardCollection()
                    }
                }
                .padding()
                HStack {
                    Text("Mes Produits")
                        .font(.custom("LibreFranklin", size: 18))
                    Spacer()
                }
                .padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack {
                        CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                        CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                        CardProduit(titre: "Chemise en lin", prix: 80, photo: "lin", category: "Made in France", type: "Vegan")
                    }                }
                .padding()
            }
            }
        }
    }
}


#Preview {
    CreatorDetailView()
}
