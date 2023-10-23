//
//  SmallCard.swift
//  EtiK
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct SmallCard: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 150, height: 100)
    }
}

#Preview {
    SmallCard()
}
