//
//  FidelityView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 27/10/2023.
//

import SwiftUI

struct FidelityView: View {
    
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    @State var firstName:String
    @State var lastName:String
    
    var body: some View {
        // Carte de fidélité
        VStack(spacing: 45) {
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 100, height: 3)
                .foregroundColor(.marron)
            
            FidelityCard {
                
                VStack {
                    Group {
                        if flipped {
                            FidelityCardBack(firstName: firstName, lastName: lastName)
                        } else {
                            FidelityCardFront(firstName: firstName, lastName: lastName)
                        }
                    }
                }.rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                
            }
            .onTapGesture {
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            }
            
            List {
                HStack {
                    Image(systemName: "checkmark.circle")
                    VStack(alignment: .leading) {
                        Text("32 points gagnés")
                        Text("Achat")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("T-shirt en lin bio")
                            .font(.caption)
                    }
                    
                }
                HStack {
                    Image(systemName: "checkmark.circle")
                    VStack(alignment: .leading) {
                        Text("5 points gagnés")
                        Text("Commentaire")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Evaluation du créateur : Chloé Scwarz")
                            .font(.caption)
                    }
                    
                }
                HStack {
                    Image(systemName: "checkmark.circle")
                    VStack(alignment: .leading) {
                        Text("5 points gagnés")
                        Text("Inscription")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Inscription à la newsletter")
                            .font(.caption)
                    }
                    
                }
                
                
            }.scrollContentBackground(.hidden)
                .listStyle(PlainListStyle())
                .padding()
                .font(.custom("Libre Franklin", size: 20))
            
        }.padding(.vertical)
        
    }
}

#Preview {
    FidelityView(firstName: "Emilien", lastName: "Giraud")
}
