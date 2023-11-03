//
//  SmallCreator.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct SmallCreator: View {
    
    @State var creator: Creator
    
    @State var destination:AnyView?
    
    var body: some View {
        NavigationLink(destination: CreatorDetailView(createur: creator)) {
            
            ZStack {
                Circle()
                    .foregroundColor(.beige)
                    .frame(width: 70, height: 70)
                
                AsyncImage(url: URL(string: creator.picture[0].url)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } else if phase.error != nil {
                        Text("No Image")
                    } else {
                        ProgressView()
                    }
                    
                }
//                    .resizable()
//                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 70)
                Text(creator.firstName)
                    .font(.custom("Italianno", size: 16))
                    .padding(.top, 50)
                    
            }
        }
    }
}

//#Preview {
//    SmallCreator(img: "creatrice")
//}
