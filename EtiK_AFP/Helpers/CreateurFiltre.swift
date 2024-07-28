//
//  CreateurFiltre.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct CreateurFiltre: View {
    
    @State var destination:AnyView?
    @State var name:String = "Chloé"
    @State var firstName:String = "Swhwarz"
    @State var city:String = "Paris"

    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(alignment: .center, spacing: 24) {
                SmallCreator(img: "profil")
                VStack(alignment: .leading) {
                    Text(name)
                    Text(firstName)
                    Text(city)
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
