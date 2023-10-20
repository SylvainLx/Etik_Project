//
//  PiluleStatut.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PiluleStatut: View {
    
    @State var progress:CGFloat = 100
    @State var statut:String = "En cours de traitement..."
    
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
                .font(.custom("LibreFranklin", size: 12))
        }
    }
}

#Preview {
    PiluleStatut()
}
