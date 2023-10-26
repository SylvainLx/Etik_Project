//
//  PopUp.swift
//  EtiK_AFP
//
//  Created by Émilien Giraud on 25/10/2023.
//

import SwiftUI

struct PopUp : View {

    @State private var showSheet = false

       var body: some View {
           Button("Present") {
               showSheet.toggle()
           }.font(.largeTitle)
           .sheet(isPresented: $showSheet) {
               SheetView()
           }
        }
}

struct SheetView: View {
   @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
           Button {
              dismiss()
           } label: {
               Image(systemName: "xmark.circle")
                 .font(.largeTitle)
                 .foregroundColor(.gray)
           }
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
         .padding()
    }
}

#Preview {
    PopUp()
}
