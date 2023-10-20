//
//  SmallButtonDestination.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct SmallButtonDestination: View {
    
    @State var title: String
    @State var destination:AnyView?
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .frame(width: 100, height: 28)
                    .foregroundColor(.marron)
                Text(title)
                    .foregroundColor(.white)
                    .font(.custom("LibreFranklin", size : 16))
            }
        }
    }
}

#Preview {
    SmallButtonDestination(title: "Contacter")
}
