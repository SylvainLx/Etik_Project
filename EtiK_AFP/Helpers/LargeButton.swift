//
//  LargeButton.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LargeButton: View {
    
    @State var labelButton:String
    
    var body: some View {
        
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.marron)
                    .frame(width: 300, height: 50)
                Text(labelButton)
                    .foregroundStyle(.white)
                    .font(.custom("Italiana", size: 20))
            }
        } 
    }
}

#Preview {
    LargeButton(labelButton: "Ajouter au panier")
}
