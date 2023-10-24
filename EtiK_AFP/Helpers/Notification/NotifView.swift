//
//  NotifView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 23/10/2023.
//

import SwiftUI

struct NotifView: View {
    @State private var selectedDate = Date()
    
    
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button("Send a notification in 5 seconds") {
                notify.sendNotification(date: Date(), type: "time", timeInterval: 5, title: "Produit ajouter au panier", body: "Votre article à bien été ajouté")
            }
            
            
            
            Spacer()
            Text("Not working ?")
                .foregroundColor(.gray)
                .italic()
            Button("Request Permission") {
                notify.askPermission()
            }
        }
    }
}

#Preview {
    NotifView()
}
