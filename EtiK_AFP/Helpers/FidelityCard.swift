//
//  FidelityCard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 27/10/2023.
//

import SwiftUI


struct FidelityCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

 
struct FidelityCardFront: View {
    
    @State private var showQRCode = false
    @State var firstName:String
    @State var lastName:String
    
    var body: some View {
        
        ZStack() {
            
            VStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, topTrailing: 30))
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.marron, Color.beige]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width:350, height: 50)
                        .shadow(radius: 5,  x: 2, y: 5)
                    HStack {
                        Text("EtiK fidelity card")
                            .font(.custom("Italiana", size: 20))
                        Spacer()
                        Text(firstName + " " + lastName)
                            .font(.custom("Italianno", size: 20))
                    }.padding(.horizontal)
                }
                
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 30))
                        .foregroundColor(.beige)
                        .frame(width:350, height: 150)
                        .shadow(radius: 5, x: 2, y: 5)
                        
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                        HStack {
                            Spacer()
                            Text("1€ = 1 point \r\r 100 points = - 15% \r 200 points = - 20% \r 300 points = - 30% \r\r sur votre prochaine commande")
                                .font(.custom("Libre Franklin", size: 12))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
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
                                    .trim(from: 0, to: 0.42)
                                    .stroke(
                                        Color.marron,
                                        style: StrokeStyle(
                                            lineWidth: 5,
                                            lineCap: .round
                                        ))
                                    .frame(width: 100)
                                    .rotationEffect(.degrees(showQRCode ? 0 : 180))
                                
                                Text("42")
                                    .font(.custom("Libre Franklin", size: 50))
                                
                            }
                             
                        }
                        
                    }.foregroundColor(.black)
                        .padding()
                }
            }
            
        }.frame(width:350, height:200)
    }
}

struct FidelityCardBack: View {
    
    @State private var showQRCode = false
    @State var firstName:String
    @State var lastName:String
    
    var body: some View {
        
        ZStack() {
            
            VStack(spacing: 0) {
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, topTrailing: 30))
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.marron, Color.beige]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width:350, height: 50)
                        .shadow(radius: 5,  x: 2, y: 5)
                    HStack {
                        Text("EtiK fidelity card")
                            .font(.custom("Italiana", size: 20))
                        Spacer()
                        Text(firstName + " " + lastName)
                            .font(.custom("Italianno", size: 20))
                    }.padding(.horizontal)
                }
                
                ZStack {
                    UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 30))
                        .foregroundColor(.beige)
                        .frame(width:350, height: 150)
                        .shadow(radius: 5, x: 2, y: 5)
                    
                    HStack {
                        Spacer()
                        Text("Scannez ce QRCode lors de vos achats* lors d'évènements ou PopUp \r\r\r * Soumis à conditions")
                            .font(.custom("Libre Franklin", size: 12))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        Image("QRcode")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                         
                }
            }
            
        }.frame(width:350, height:200)
            .rotation3DEffect(
                .degrees(180),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
    }
}


extension Color {
    static let gold = Color(red: 1.0, green: 0.84, blue: 0.0)
}

#Preview {
    FidelityCard<FidelityCardFront>(content: { FidelityCardFront(firstName: "Emilien", lastName: "Giraud") })
}
