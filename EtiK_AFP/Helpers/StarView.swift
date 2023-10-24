//
//  StarView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct StarView: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<4) { _ in
                Image(systemName: "star.fill")
            }
            Image(systemName: "star.leadinghalf.filled")
        }
        .foregroundColor(.yellow)
    }
}

#Preview {
    StarView()
}
