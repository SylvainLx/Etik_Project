//
//  LikeButton.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 24/10/2023.
//

import SwiftUI

struct LikeButton: View {
     
    @State var isLiked: Bool = false
    @State var likesCount: Int = 0
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.interactiveSpring(duration: 2) ) {
                    isLiked.toggle()
                }
            }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 18, height: 16)
                    .foregroundColor(.red)
            })
        }
    }
}


#Preview {
    LikeButton()
}
