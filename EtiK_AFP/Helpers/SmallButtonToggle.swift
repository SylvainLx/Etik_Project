//
//  SmallButton.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct SmallButtonToggle: View {
    @State private var isPresented: Bool = false
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label : {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .frame(width: 100, height: 28)
                    .foregroundColor(isPresented ? .beige : .marron)
                Text(isPresented ? "Suivi" : "Suivre")
                    .foregroundColor(.white)
                    .font(.custom("Italiana", size: 20))
            }
        })
    }
}

#Preview {
    SmallButtonToggle()
}
