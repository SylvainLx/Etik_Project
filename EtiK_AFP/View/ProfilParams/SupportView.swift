//
//  SupportView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 25/10/2023.
//

import SwiftUI

struct SupportView: View {
    
    let chatSupport = Chat.sampleChat
    let chatContent: Chat = Chat.sampleChat[1]
    @State var myChat = ""
    let placeHolderText = "Entrez votre question"
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                VStack{
                    HStack(spacing: 20) {

                    Image(chatContent.person.imgString)
                             .resizable()
                            .frame(width: 70, height: 70)
                             .clipShape(Circle())

                         ZStack {
                             VStack(alignment: .leading, spacing: 5) {
                                 HStack {
                                     Text(chatContent.person.name)
                                         .bold()
                                         .foregroundColor(.white)

                                     Spacer()

                                     Text(chatContent.messages.last?.date.descriptiveString() ?? "")
                                         .foregroundColor(.white)
                                       

                                 }

                                 HStack {

                                     Text(chatContent.messages.last?.text ?? "")
                                         .bold()
                                         .foregroundColor(.white)
                                         .lineLimit(2)
                                         .frame(height: 50, alignment: .top)
                                         .frame(maxWidth: .infinity, alignment: .leading)
                                         .multilineTextAlignment(.leading)
                                         .padding(.trailing, 40)
                                     }
                             }
                       Circle()
                                 .foregroundColor(chatContent .hasUnreadMessage ? (Color(red: 0.747, green: 0.668, blue: 0.447)): .clear)

                                 .frame(width: 18, height: 18)
                                 .frame(maxWidth: .infinity, alignment: .trailing)

                         }
                     }
                     .frame(height: 80 )
                    Spacer()
                    
                    TextField(placeHolderText, text: $myChat)
                                                .keyboardType(.asciiCapable)
                                                .textFieldStyle(.roundedBorder)
                                                .padding(24)
                }
                
                
                .navigationTitle("Posez votre question")
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                })
                
                
                
            }
        }
        
    }
}

#Preview {
    SupportView()
}
