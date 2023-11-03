//
//  EventView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct EventView: View {
    @EnvironmentObject var dataFilter: DataFilterModel
    
    @State var isOn = false
    
    var body: some View {
        VStack(alignment: .center)  {
            HStack {
                Spacer()
                Spacer()
                Text("Evènements  ")
                    .font(.custom("Italianno", size: 50))
                    .padding(.leading, 2)
                    .padding(.vertical, -10)
                Spacer()
                Button(action: {
                    isOn.toggle()
                }
                       , label:  { Text( isOn ? "Liste" : "Carte") }
                )
                .padding(.trailing)
                .accentColor(.marron)
            }
            if isOn {
                MapView()
            } else {
                EventScreenView()
            }
        }
    }
}

#Preview {
    EventView()
        .environmentObject(DataFilterModel())
}
