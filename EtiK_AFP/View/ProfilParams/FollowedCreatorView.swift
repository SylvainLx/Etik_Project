//
//  FollowedCreatorView.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct FollowedCreatorView: View {
    @State var name: String
    @State var entreprise: String
    @State var city: String
    @State var img: String
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        VStack {
            TitleCard(title: "Mes créateurs suivis")
            LazyVGrid(columns: columns, content: {
                ForEach(0..<5) { _ in
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(.beige, lineWidth: 5)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 100)
                            Image(img)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .background(.white)
                                .cornerRadius(40)
                        }
                        Text(name)
                        Text(entreprise)
                        Text(city)
                            .font(.custom("Libre Franklin", size : 16))
                    }
                }
                .padding(.vertical, 8)

            }
            )
            .padding()
            Spacer()
        }
    }
}

        
    



#Preview {
    FollowedCreatorView(name: "Chloé Schwarz", entreprise: "Ribambelle", city: "Paris", img: "creatrice")
}
