//
//  chatRow.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 20/10/2023.
//

import SwiftUI

struct chatRow: View {

    let chat: Chat

    var body: some View {
       HStack(spacing: 20) {

       Image(chat.person.imgString)
                .resizable()
               .frame(width: 70, height: 70)
                .clipShape(Circle())

            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(chat.person.name)
                            .bold()
                            .foregroundColor(.white)

                        Spacer()

                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                            .foregroundColor(.white)
                          

                    }

                    HStack {

                        Text(chat.messages.last?.text ?? "")
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
                    .foregroundColor(chat .hasUnreadMessage ? (Color(red: 0.747, green: 0.668, blue: 0.447)): .clear)

                    .frame(width: 18, height: 18)
                    .frame(maxWidth: .infinity, alignment: .trailing)

            }
        }
        .frame(height: 80 )
    }
}

struct chatRow_Previews: PreviewProvider {
    static var previews: some View {
        chatRow(chat: Chat.sampleChat[1])
    }
}
