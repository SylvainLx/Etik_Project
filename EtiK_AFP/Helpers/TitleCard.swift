//
//  TitleCard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 25/10/2023.
//

import SwiftUI

struct TitleCard: View {
    
    @State var title:String
    
    var body: some View {
        Text(title)
            .font(.custom("Italianno", size: 50))
            .padding(.top, -50)
            .padding(.bottom)
            .frame(width: 300)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    TitleCard(title: "Chemise en lin")
}
