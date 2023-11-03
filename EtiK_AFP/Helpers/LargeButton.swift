//
//  LargeButton.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LargeButton: View {
    var labelButton: String
    var colorSelect: Color
    var destination: AnyView?
    
    @State private var isActive = false
    
    var body: some View {
        
        VStack {
            NavigationLink("", destination: destination, isActive: $isActive)
                .opacity(0)
            
            
            Button(action: {
                isActive = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(colorSelect)
                        .frame(width: 300, height: 50)
                    Text(labelButton)
                        .foregroundColor(.white)
                        .font(.custom("Libre Franklin", size: 16))
                }
            }
        }
    }
}


#Preview {
    LargeButton(labelButton: "Ajouter au panier", colorSelect: .marron, destination: AnyView(PayView()))
}
