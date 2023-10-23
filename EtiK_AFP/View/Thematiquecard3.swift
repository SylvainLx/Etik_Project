//
//  Thematiquecard3.swift
//  EtiK_AFP
//
//  Created by apprenant48 on 23/10/2023.
//

import SwiftUI

struct Thematiquecard3: View {
    var body: some View {
        ZStack {
        Rectangle()
            .frame(height: 150)
            .foregroundColor(.white)
        Image("newyear")
                .resizable()
                .frame(height: 150)
        Image("2024")
                    .resizable()
                    .frame(height: 50)
                    .padding(.top, 60)

        }
    }
}

#Preview {
    Thematiquecard3()
}
