//
//  SupportView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 25/10/2023.
//

import SwiftUI

struct SupportView: View {
    
    let chatSupport = Chat.sampleChat
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                
                
                VStack{
                    ForEach (chatSupport) { chat in
                        
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                        }) {
                            ChatRow(chat: chat)
                            
                            
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    Spacer()
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
