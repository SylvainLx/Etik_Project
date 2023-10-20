//
//  TextFieldProfil.swift
//  EtiK
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct TextFieldProfil: View {
    
    @State var title:String
    @Binding var valeur:String
    
    
    var body: some View {
        
        TextField(title, text: $valeur)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.beige, lineWidth: 2)
                    .frame(height: 50)
            ).padding()
        
    }
}

#Preview {
    TextFieldProfil(title: "Nom", valeur: .constant(""))
}
