//
//  CreationView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct CreationView: View {
    var body: some View {
        
        
        VStack {
            HStack {
                Image(systemName: "paperplane")
                    .font(.custom("Italianno", size: 20))
                Spacer()
                Text("Créations")
                    .font(.custom("Italianno", size: 50))
                Spacer()
                Image(systemName: "bell")
                    .font(.custom("Italianno", size: 20))
            }.padding(.horizontal)
            
        Spacer()
            
            CardProduit()
            CardCollection()
            
            
            
        }
         
    }
}

#Preview {
    CreationView()
}
