//
//  ModificationCompteView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct ModificationCompteView: View {
    var body: some View {
        
        
        ZStack {
            Circle()
                .foregroundColor(.beige)
            Image()
                .resizable()
                .frame(width: 200)
                .padding(.top, 350)
        }.edgesIgnoringSafeArea(.all)
        
        
    }
}

#Preview {
    ModificationCompteView()
}
