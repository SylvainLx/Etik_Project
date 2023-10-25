//
//  chatView.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 20/10/2023.
//

import SwiftUI

struct chatView: View {
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    
    
    
    func toolBarView() -> some View {
        VStack{
            
            let height: CGFloat = 37
            HStack {
                TextField("Message...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action: sendMessage){
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                        Circle()
                            .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
            
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage() {
        
    }
    let columns = [GridItem(.flexible(minimum: 10))]
    
    var body: some View {
        VStack(spacing: 0) {
            
GeometryReader{ reader in
                ScrollView{
                
                    getMessagesView(viewWidth: reader.size.width)
                        .padding(.horizontal)
                        .padding(.top, 90)
                
                }
            }
                            .ignoresSafeArea()
                            .background(LinearGradient(gradient: Gradient(colors: [.cyan, .init(red: 0.067, green: 0.195, blue: 0.427)]), startPoint: .bottom, endPoint: .top))
            
            toolBarView()
        }
    }
    
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0){
            ForEach(chat.messages) { message in
                let isReceived = message.type == .Received
                HStack {
                   
                ZStack {
                    
                      
                        Text(message.text)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(isReceived ? Color.black.opacity(0.2) : .blue.opacity(0.9))
                        .cornerRadius(13)
                    }
                .frame(width: viewWidth * 0.7, alignment : isReceived ? .leading : .trailing )
                .padding(.vertical)
            
               
                    
                }
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
        
            }
        }
    
    }
   
}

struct chatView_Previews: PreviewProvider {
    static var previews: some View {
        chatView(chat: Chat.sampleChat[1])
    }
}
