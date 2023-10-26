//
//  CategorieCard.swift
//  EtiK_AFP
//
//  Created by apprenant48 on 20/10/2023.
//

import SwiftUI

struct CategorieCard: View {
    @State var categories:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 130, height: 80)
                .padding(.top, 22)
                .foregroundColor(.beige)
            Image("madeinfrancecategory")
        }
        Text(categories)
            .font(.custom("LibreFranklin", size: 13))
    }
}

#Preview {
    CategorieCard(categories: "Made in France 🇫🇷")
}
