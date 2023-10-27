//
//  FidelityCard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 27/10/2023.
//

import SwiftUI

struct FidelityCard: View {
    
    @State private var showQRCode = false
    
    var body: some View {
        
        ZStack() {
            
            VStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, topTrailing: 30))
                        .frame(width:350, height: 50)
                        .foregroundColor(.darkBeige)
                    HStack {
                        Text("EtiK fidelity card")
                            .font(.custom("Italiana", size: 20))
                        Spacer()
                        Text("Emma White")
                            .font(.custom("Italianno", size: 20))
                    }.padding(.horizontal)
                }
                
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 30))
                        .frame(width:350, height: 150)
                        .foregroundColor(.beige)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                        HStack {
                            Spacer()
                            
                            Text("GOLD")
                                .foregroundColor(.white)
                                .blur(radius: 2.0)
                                .font(.custom("Libre Franklin", size: 50))
                                .overlay(
                                    Text("GOLD")
                                        .font(.custom("Libre Franklin", size: 50))
                                        .foregroundColor(.gold)
                                    
                                        .offset(x: 2, y: -2)
                                )
                            
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showQRCode.toggle()
                                }
                            }) {
                                if showQRCode {
                                    Image("QRcode")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .scaleEffect(showQRCode ? 1.0 : 0.1)
                                } else {
                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color.gray.opacity(0.2),
                                                style: StrokeStyle(
                                                    lineWidth: 5,
                                                    lineCap: .round
                                                ))
                                            .frame(width: 100)
                                        
                                        Circle()
                                            .trim(from: 0, to: 0.72)
                                            .stroke(
                                                Color.marron,
                                                style: StrokeStyle(
                                                    lineWidth: 5,
                                                    lineCap: .round
                                                ))
                                            .frame(width: 100)
                                            .rotationEffect(.degrees(showQRCode ? 0 : 180))
                                        
                                        Text("72 points")
                                            .font(.custom("Libre Franklin", size: 15))
                                        
                                    }
                                    
                                }
                            }
                        }
                        
                    }.foregroundColor(.black)
                        .padding()
                }
            }
            
        }.frame(width:350, height:200)
    }
}

extension Color {
    static let gold = Color(red: 1.0, green: 0.84, blue: 0.0)
}

#Preview {
    FidelityCard()
}
