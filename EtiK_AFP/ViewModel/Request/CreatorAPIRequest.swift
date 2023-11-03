//
//  CreatorAPIRequest.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import Foundation
import CoreLocation

class CreatorAPIRequest : ObservableObject{
   
    @Published var allCreator = [Creator]()
    
    func fetchedCreator() async -> [Creator]{
        
        var resultCreator = [Creator]()
        
        guard let url = URL(string: "https://api.airtable.com/v0/appmXQklmnHQ3735X/Creator") else {
            print("Url unavailable")
            return resultCreator
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        do {
            //action
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
               
                print("Request wasn't successfull")
                return resultCreator
            }
            // Décoder le fichier JSON
            let decodedCreator = try JSONDecoder().decode(CreatorWelcome.self, from: data)
            
            decodedCreator.records.forEach { record in
                resultCreator.append(record.fields)
            }
            resultCreator.sort {
                $0.id < $1.id
            }
            
            return resultCreator
            
        } catch let error {
            print("Error:", error)
        }
        
        return resultCreator
            
    }
}
