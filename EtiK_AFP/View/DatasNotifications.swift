//
//  DatasNotifications.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 27/10/2023.
//

import Foundation


struct Notification : Identifiable {
    let id = UUID ()
    let image: String
    let name: String
    let description: String
    
   static let notificationsList : [Notification] = [
    Notification(image: "user1", name: "Hermex", description: "a mis en ligne un nouvel article, viens checker ça!"),
        Notification(image: "lin", name: "Chemise 100% lin", description: "Ta commande n°2571023 a été expediée !"),
        Notification(image: "halloween", name: "EtiK", description: "Bientôt halloween, découvres ici notre sélection 👻🎃"),
        
        ]
    
}
