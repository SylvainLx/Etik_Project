//
//  PiluleLabel.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct PiluleLabel: View {
    
    @State var label: String
    
    var body: some View {
         
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.beige)
                .frame(width: 50, height: 30)
            
            Text(label)
                .foregroundStyle(.white)
                .font(.custom("LibreFranklin", size: 15))
            
        }
        
    }
}

#Preview {
    PiluleLabel(label: "🤲🏻")
}
