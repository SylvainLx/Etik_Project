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
    @State var imgUrl: String
    
    var body: some View {
        VStack {
            HStack (spacing: 16) {
                ZStack(alignment: .bottom) {
                    
                    SmallCard()
                        .foregroundColor(.beige)
                    AsyncImage(url: URL(string: imgUrl)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .padding(.bottom)
                                .shadow(radius: 5)
                        } else if phase.error != nil {
                            Image("lin")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .padding(.bottom)
                                .shadow(radius: 5)
                        } else {
                            ProgressView()
                        }
                    }
                       
                }
                
                VStack(alignment: .leading) {
                    Text(name)
                        .fontWeight(.bold)
                    Text("\(category) / \(type)")
                        .font(.footnote)
                    Text("\(price) €")
                        .fontWeight(.bold)
                    Text("n° \(String(format: "%d", numberOfOrder))")
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
    CommandReturnCard(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...", imgUrl: "https://v5.airtableusercontent.com/v1/22/22/1698674400000/ae7g33NPuDipp_WB_FlVHg/lTRxkcOXU4lEqon5WTJW23r35NVoBtTq4P0MYKVRcBt-Nbs5bbmJbVdrLwB5TDJV3jvTV4S2riIgXAPT9BOGL8HuVZcmgSC8GMn8eG2r4KBL9vUKg1jXYNqmBLlv1Ssb/5uwNOeX4Qpb2PPjVp3t-K1_9Fi77q78-6lzSkwfGVCY")
}
