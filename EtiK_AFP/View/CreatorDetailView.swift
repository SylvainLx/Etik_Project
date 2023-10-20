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
                    HStack(spacing: 0) {
                        ForEach(0..<4) { _ in
                            Image(systemName: "star.fill")
                        }
                        Image(systemName: "star.leadinghalf.filled")
                    }
                        .foregroundColor(.yellow)
                    Text("5/5")
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
            .padding()
            ScrollView(.horizontal) {
                Text("ScrollView Horizontal Collection")
            }
            .padding()
            ScrollView(.horizontal) {
                Text("ScrollView Horizontal Produits")
            }
            .padding()
        }
    }
}


#Preview {
    CreatorDetailView()
}
