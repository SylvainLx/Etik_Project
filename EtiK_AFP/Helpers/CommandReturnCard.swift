//
//  CommandReturnCard.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 23/10/2023.
//

import SwiftUI

struct CommandReturnCard: View {
    @State var name : String
    @State var category : String
    @State var type : String
    @State var price : Int
    @State var numberOfOrder : Int
    @State var productSize : String
    @State var progress:CGFloat
    @State var statut:String
    
    var body: some View {
        VStack {
            HStack (spacing: 16) {
                ZStack(alignment: .bottom) {
                    
                    SmallCard()
                        .foregroundColor(.beige)
                    Image("lin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.bottom)
                        .shadow(radius: 5)
                }
                
                VStack(alignment: .leading) {
                    Text(name)
                        .fontWeight(.bold)
                    Text("\(category) / \(type)")
                        .font(.footnote)
                    Text("\(price) €")
                        .fontWeight(.bold)
                    Text("n° \(numberOfOrder)")
                        .font(.footnote)
                }.padding(.top, 8)
                VStack {
                    Text("Taille")
                        .fontWeight(.bold)
                    Text(productSize)
                }
            }
            PiluleStatut(progress: progress, statut: statut)
                .padding(.top, 4)
            Divider()
                .padding()
        }    }
}

#Preview {
    CommandReturnCard(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...")
}
