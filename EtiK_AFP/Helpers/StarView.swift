//
//  StarView.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 23/10/2023.
//

import SwiftUI

struct StarView: View {
    
    @State var note: Double
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { index in
                Image(systemName: starImageName(index: index))
                    .foregroundColor(.yellow)
            }
        }
    }
    
    func starImageName(index: Int) -> String {
        let filledStarCount = Int(note)
        if index < filledStarCount {
            return "star.fill"
        } else if index == filledStarCount {
            let remainder = note - Double(filledStarCount)
            if remainder >= 0.5 {
                return "star.leadinghalf.fill"
            } else {
                return "star"
            }
        } else {
            return "star"
        }
    }
}

#Preview {
    StarView(note: 3.2)
}

 
