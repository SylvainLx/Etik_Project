//
//  PiluleStatut.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PiluleStatut: View {
    
    @State var progress:CGFloat
    @State var statut:String
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.gray.opacity(0.5))
                    .frame(width: 300, height: 15)
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.darkBeige)
                    .frame(width: progress, height: 15)
            }
            
            Text(statut)
                .shadow(radius: 10)
                .font(.custom("Libre Franklin", size: 12))
        }
    }
}

#Preview {
    PiluleStatut(progress: 100, statut: "En cours de traitement...")
}
