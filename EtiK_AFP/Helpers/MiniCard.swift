//
//  MiniCard.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct MiniCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 75, height: 75)
    }
}

#Preview {
    MiniCard()
}
