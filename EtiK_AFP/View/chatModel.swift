//
//  chatModel.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 20/10/2023.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person : Person
    var messages : [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}
struct Message: Identifiable {
    
    enum MessageType {
        case Sent, Received
        
    }
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date ) {
        self.date = date
        self.type = type
        self.text = text
        
    }
    
    init(_ text: String, type: MessageType ) {
        self.init(text, type: type, date: Date())
    }
    
}

extension Chat {
    
    static let sampleChat = [
        
        Chat(person: Person(name: "Chloé", imgString: "user1"), messages: [
            Message("Bonjour ", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Merci pour votre abonnement à ma page créateur", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("N'hesitez pas si vous avez des questions", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3 )),
            Message("Bonjour", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("J'adore vos creations, si je pouvais, j'acheterais tout !!", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Merci ça me touche :)", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Si mes clientes sont heureuses, c'est le principal", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Je n'achete pratiquement que vos creations", type: .Received, date: Date()), ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "Veronique", imgString: "user2"), messages: [
            Message("Bonjour,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Je me permets de vous contacter car je voudrais savoir si vous proposez la livraison en 48 heures", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("C'est pour mon gala de fin d'annee qui a lieu vendredi", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Vous pensez que ça le ferait? ", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("Bonjour", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Oui", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("La livraison peut se faire en 48h", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
            Message("Et je peux expedier le colis demain matin", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
       
        ]),
        
        Chat(person: Person(name: "Noela", imgString: "user3"), messages: [
            Message("Bonjour", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Votre commande a ete expedie, cordialement", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("Bonsoir", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Au top merci !! Trop hâte de la recevoir", type: .Received, date: Date()),
       
        ]),
        
     ]
}
    
