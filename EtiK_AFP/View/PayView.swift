//
//  PayView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 31/10/2023.
//

import SwiftUI
import Combine

struct PayView: View {
    
    @EnvironmentObject var panier: Panier
    
    @State var numCard:Int = 4455665577889988
    @State var nomCard:String = "Emilien Giraud"
    @State var crypto:Int = 432
    @State var date:String = "21/12"
    
    var body: some View {
        
        NavigationStack {
             
            VStack{
                
                TitleCard(title: "Paiement")
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width:350, height:200)
                        .cornerRadius(30)
                        .foregroundColor(.darkBeige)
                    
                    VStack() {
                        HStack {
                            Image(systemName: "wave.3.left")
                            Spacer()
                            Text("VISA")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }.frame(width: 320, height: 20)
                        Spacer()
                        Text("\(numCard)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Spacer()
                        HStack {
                            Text("\(crypto)")
                            Spacer()
                            Text(date)
                        }
                        
                        Text(nomCard)
                        
                    }.padding()
                        .foregroundColor(.white)
                        .frame(width:350, height:200)
                        
                    
                }
             
                
                TextField("Nom", text: $nomCard)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.beige, lineWidth: 2)
                            .frame(height: 40)
                    ).padding(.horizontal)
                
                TextField("Numéro de carte", value: $numCard, format: .number)
                    .keyboardType(.numberPad)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.beige, lineWidth: 2)
                            .frame(height: 40)
                    ).padding(.horizontal)
                
                HStack {
                    TextField("Cryptogramme", value: $crypto, format: .number)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                    
                    TextField("Date", text: $date)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.beige, lineWidth: 2)
                                .frame(height: 40)
                        ).padding(.horizontal)
                }
                Spacer()
                LargeButton(labelButton: "Payer", colorSelect: .marron)
                    .padding(.vertical)
            }
        }
    }
}



#Preview {
    PayView()
        .environmentObject(Panier())
}
