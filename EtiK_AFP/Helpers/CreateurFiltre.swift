//
//  CreateurFiltre.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct CreateurFiltre: View {
    
    @State var destination:AnyView?

    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(alignment: .center, spacing: 24) {
                SmallCreator(img: "creatrice")
                    .frame(width: 50, height:50)
                VStack(alignment: .leading) {
                    Text("Nom")
                    Text("Prénom")
                    Text("Ville")
                }
                .font(.custom("LibreFranklin", size: 16))
                .fontWeight(.bold)
                StarView(note: 3)
                    .padding(.top, 36)
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    CreateurFiltre()
}
