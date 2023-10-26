//
//  CardThematique.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CardThematique: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 150)
                .foregroundColor(.beige)
            
            ZStack {
                Image("thematiqueimg2")
                    .resizable()
                    .frame(width: 250, height: 150)
                .padding(.top, 0)
                Image("thematiqueimg4")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .offset(x:-30)
                    .padding(.top, 40)
            }
            
            HStack {
                Image("thematiqueimg1")
                    .resizable()
                    .frame(width: 100, height: 140)
                    .padding(.top, 10)
                    .offset(x:-30)

                Image("thematiqueimg3")
                    .resizable()
                    .frame(width: 250, height: 180)
                    .padding(.top, -30)
                    .offset(x:99)
            }
        }.frame(width: 400, height: 150)
    }
}

#Preview {
    CardThematique()
}
