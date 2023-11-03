//
//  CommandDetailView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 23/10/2023.
//

import SwiftUI

struct CommandDetailView: View {
    let chats = Chat.sampleChat
    
    @State var name : String
    @State var category : String
    @State var type : String
    @State var price : Int
    @State var numberOfOrder : Int
    @State var productSize : String
    @State var progress:CGFloat
    @State var statut:String
    @State var adress = "40 rue des chalets"
    @State var postalCode = "33000"
    @State var city = "BORDEAUX"
    @State var imgUrl: String
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 16) {
                Text("Commande n° \(String(format: "%d", numberOfOrder))  ")
                    .font(.custom("Italianno", size: 50))
                
                HStack {
                    // NavigationLink(destination: DetailProduit()) {
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
                    //  }
                    VStack(alignment: .leading) {
                        Text(name)
                            .fontWeight(.bold)
                        Text("\(category) / \(type)")
                            .font(.footnote)
                        Text("\(price) €")
                            .fontWeight(.bold)
                        
                    }
                }
                PiluleStatut(progress: progress, statut: statut)
                    .padding(.top, 4)
                VStack(alignment: .leading) {
                    Text("Date de la commande : 18 oct 2023")
                        .font(.custom("LibreFranklin", size : 16))
                    Text("Total de la commande : \(price) €")
                        .font(.custom("LibreFranklin", size : 16))
                    Text("Adresse de livraison :")
                    Text("\(adress), \(postalCode) \(city)")
                }.padding(.vertical)
                
                Text("Le créateur met tout en oeuvre pour confectionner votre commande")
                    .font(.custom("LibreFranklin", size : 16))
                    .padding(.top)
                
                VStack {
                    Text("Vous souhaitez poser une question au créateur ?")
                        .font(.custom("LibreFranklin", size : 16))
                    SmallButtonDestination(title: "C'est ici !", destination: AnyView(ChatView(chat: chats[0])))
                        .padding()
                }.padding(.top)
                VStack {
                    Text("Vous souhaitez annuler votre commande ?")
                        .font(.custom("LibreFranklin", size : 16))
                    SmallButtonDestination(title: "Annuler")
                        .padding()
                }.padding(.top)
                Spacer()
            }
        }
    }
}

#Preview {
    CommandDetailView(name: "Chemise en Lin", category: "Made in France", type: "Vegan", price: 100, numberOfOrder: 3005643, productSize: "XS", progress: 100, statut: "En cours de traitement...", imgUrl: "https://v5.airtableusercontent.com/v1/22/22/1698674400000/PDVOb9DL_p6pF2p1fix9TQ/PjMvuH9FpO-dEPSidLEcPshrS5-YUho9n9pg-4qnubRWo-E5_XRegQnOn91k03tpcRgh52POlJhlOhoYsoLOi55s-1GeexnLjA93Rpjd0HE/m5OdeU67_bybV0D0LEdL85RocBhPNAxTzbDEaxQT3pk")
}
