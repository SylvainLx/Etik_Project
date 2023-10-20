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
                    .foregroundColor(.marron)
                Text(isPresented ? "Suivi" : "Suivre")
                    .foregroundColor(.white)
                    .font(.custom("LibreFranklin", size : 16))
            }
        })
    }
}

#Preview {
    SmallButtonToggle()
}
