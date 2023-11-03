//
//  EventAPIRequest.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import Foundation

class EventAPIRequest: ObservableObject {
    @Published var allEvents = [Event]()
    
    func fetchedEvent() async -> [Event] {
        var resultEvent = [Event]()
        
        guard let url = URL(string: "https://api.airtable.com/v0/appmXQklmnHQ3735X/Events") else {
            print("URL unavailable")
            return resultEvent
        }
        
        var request = URLRequest(url: url) //-> on pause la question a cette URL
        request.httpMethod = "GET" // -> ma demande
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization") // -> qui je suis
         

        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)
            

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Request wasn't successful")
                return resultEvent
            }
            
            let decodedEvent = try JSONDecoder().decode(EventRequest.self, from: data)
            print(decodedEvent) //<- résultat du décodage
            

            decodedEvent.records.forEach { record in
                resultEvent.append(record.fields)
            }
            return resultEvent
            
        } catch let error { //<- si t'arrives pas à faire les actions dans le DO, renvoie une erreur
            print("ERROR: ", error)
        }
        
        return resultEvent
    }
    
}
