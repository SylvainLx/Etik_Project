//
//  EventView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        
        VStack {
            Text("Evènements  ")
                .font(.custom("Italianno", size: 50))
                .padding(.leading, 2)
                .padding(.vertical, -10)
            Spacer()
        }
    }
}

#Preview {
    EventView()
}
