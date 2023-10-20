//
//  CardCollection.swift
//  EtiK
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CardCollection: View {
    var body: some View {
         
            VStack {
                 
                ZStack(alignment: .bottom) {
                    
                    SmallCard()
                        .foregroundColor(.darkBeige)
                    
                    Image("shirt")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.bottom, 30)
                        .shadow(radius: 5)
                }
                
                
                Text("Collection")
                    .font(.custom("Italiana", size: 20))
                Text("Vegan")
                    .font(.custom("LibreFranklin", size: 10))
                    .foregroundStyle(.gray)
            }
         
    }
}

#Preview {
    CardCollection()
}
