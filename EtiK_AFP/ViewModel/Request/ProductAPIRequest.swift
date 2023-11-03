//
//  ProductAPIRequest.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import Foundation

// fonctions pour le call API

class ProductsAPIRequest: ObservableObject {
    
    @Published var allProducts = [Product]()
    
    func fetchedProducts() async -> [Product] {
        var resultProducts = [Product]()
        
        //1ere préparation -> est ce que mon URL est le bon ?
        guard let url = URL(string: "https://api.airtable.com/v0/appmXQklmnHQ3735X/Products") else {
            print("Url unavailable")
            return resultProducts
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
                return resultProducts
            }
            // Décoder le fichier JSON
            let decodedProducts = try JSONDecoder().decode(ProductRequest.self, from: data)
            
            decodedProducts.records.forEach { record in
                resultProducts.append(record.fields)
            }
            resultProducts.sort {
                $0.id < $1.id
            }
            
            return resultProducts
            
        } catch let error {
            print("Error:", error)
        }
        
        return resultProducts
    }
    
    func postProducts(product: Product) async -> String {

            var requestResult = ""

            let airTableJSON: [String: Product] = ["fields": product]

            print(airTableJSON)

            guard let encoded = try? JSONEncoder().encode(airTableJSON) else {
                print("failed to encode data")
                requestResult = "We are sorry, your custom drink couldn't be processed. Please try at another time."
                return requestResult
            }

            print(encoded)

            guard let url = URL(string: "https://api.airtable.com/v0/appmXQklmnHQ3735X/Products") else {
                print("Invalid URL")
                requestResult = "We are sorry, your custom drink couldn't be processed. Please try at another time."
                return requestResult
            }

            var request = URLRequest(url: url)
            request.setValue("Bearer (apiKey)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"

            do {
                let (_, response) = try await URLSession.shared.upload(for: request, from: encoded)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Failed request (response.debugDescription)")
                    requestResult = "We are sorry, your custom drink couldn't be processed. Please try at another time."
                    return requestResult
                }

                requestResult = "Thank you, your request has been registered and will be treated shortly."
            } catch let error {
                print("ERROR: (error)")
            }
            return requestResult

        }
}

