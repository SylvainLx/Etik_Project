//
//  SmallButton.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct SmallButton: View {
    
    @State var labelButton:String
    
    var body: some View {
        
        Button{
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.marron)
                    .frame(width: 120, height: 40)
                Text(labelButton)
                    .foregroundStyle(.white)
                    .font(.custom("Italiana", size: 20))
            }
        }
    }
}

#Preview {
    SmallButton(labelButton: "Suivre")
}
