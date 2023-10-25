//
//  ARButton.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 24/10/2023.
//

import SwiftUI

struct ARButton: View {
    var body: some View {
        
        
            
            Button(action: {
                
            }, label: {
                ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 75, height: 40)
                .foregroundColor(.white)
                
                Text("Tester en AR")
                    .font(.custom("LibreFranklin", size: 10))
                }
            }).foregroundColor(.black)
           
        
        
        
        
    }
}

#Preview {
    ARButton()
}
