//
//  chatBase.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 20/10/2023.
//

import SwiftUI

struct Chatbase: View {
    let chats = Chat.sampleChat
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                
                
                VStack{
                    ForEach (chats) { chat in
                        
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                        }) {
                            ChatRow(chat: chat)
                            
                            
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    Spacer()
                }
                
                
                .navigationTitle("Mes messages")
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                })
                
                
                
            }
        }
        
        
    }
    
    struct chatbase_Previews: PreviewProvider {
        static var previews: some View {
            Chatbase()
        }
    }
    
}
