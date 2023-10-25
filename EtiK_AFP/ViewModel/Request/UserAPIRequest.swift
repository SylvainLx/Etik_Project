//
//  APIRequest.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import Foundation

// fonctions pour le call API

class UserAPIRequest: ObservableObject {
    
    @Published var allUser = [User]()
    
    func fetchedUser() async -> [User] {
        var resultUser = [User]()
        
        //1ere préparation -> est ce que mon URL est le bon ?
        guard let url = URL(string: "https://api.airtable.com/v0/appmXQklmnHQ3735X/User") else {
            print("Url unavailable")
            return resultUser
        }
        
        //si oui, on prépare la requete : je suis X et je veux GET
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        do {
            //action
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Request wasn't successfull")
                return resultUser
            }
            
            let decodedUsers = try JSONDecoder().decode(UserRequest.self, from: data)
            
            decodedUsers.records.forEach { record in
                resultUser.append(record.fields)
            }
            resultUser.sort {
                $0.lastName < $1.lastName
            }
            
            print(resultUser)
            return resultUser
            
        } catch let error {
            print("Error:", error)
        }
        
        return resultUser
    }
    
}
