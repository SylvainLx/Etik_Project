//
//  PiluleLabel.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI



struct PiluleLabel: View {
    
    var label: String
    @State var labelText:String
    
    @Binding var selectedPiluleLabel: String?
    
    var isExpanded: Bool {
        selectedPiluleLabel == label
    }
    
    var body: some View {
        
        
        VStack {
            Button(action: {
                withAnimation {
                    selectedPiluleLabel = isExpanded ? nil : label
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.beige)
                        .frame(width: 50, height: 30)
                    
                    Text(label)
                        .foregroundStyle(.white)
                        .font(.custom("LibreFranklin", size: 15))
                    
                    
                }.scaleEffect(isExpanded ? 1.3 : 1.0)
                    .offset(y: isExpanded ? 5 : 0)
            }
            
            if isExpanded {
                BubbleView(text: labelText)
            }
        }
    }
}

struct BubbleView: View {
    let text: String
    
    var body: some View {
        ZStack {
             
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 100, height: 25)
                .padding(5)
                .shadow(radius: 1)
            ArrowShape()
                .fill(Color.white)
                .frame(width: 10, height: 5)
                .offset(y: -15)
                .shadow(radius: 1)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 100, height: 25)
                .padding(5) 
            Text(text)
                .font(.custom("LibreFranklin", size: 12))
                .multilineTextAlignment(.center)
        }
        
    }
}
struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    PiluleLabel(label: "♥️", labelText: "Coeur", selectedPiluleLabel: .constant("label"))
}
