//
//  Thematiquecard2.swift
//  EtiK_AFP
//
//  Created by apprenant48 on 23/10/2023.
//

import SwiftUI

struct Thematiquecard2: View {
    var body: some View {       
        ZStack {
        Rectangle()
            .frame(height: 150)
            .foregroundColor(.white)
        Image("christmas-banner")
                .resizable()
                .frame(height: 150)
        Image("merry-christmas")
                    .resizable()
                    .frame(height: 150)
                    .offset(x:-50)

        }

        }
    }

#Preview {
    Thematiquecard2()
}
