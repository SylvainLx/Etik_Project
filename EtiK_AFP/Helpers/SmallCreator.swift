//
//  SmallCreator.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct SmallCreator: View {
    
    @State var img: String
    @State var destination:AnyView?
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Circle()
                    .foregroundColor(.beige)
                    .frame(width: 70, height: 70)
                Image(img)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

#Preview {
    SmallCreator(img: "creatrice")
}
