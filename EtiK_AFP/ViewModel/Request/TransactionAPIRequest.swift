//
//  TransactionAPIRequest.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import Foundation

class TransactionAPIRequest: ObservableObject {
    
    @Published var allTransaction = [Transaction]()
    
    func fetchedTransaction() async -> [Transaction] {
        var resultTransactions = [Transaction]()
        
        //1ere préparation -> est ce que mon URL est le bon ?
        guard let url = URL(string: "https://api.airtable.com/v0/appmXQklmnHQ3735X/Transactions") else {
            print("Url unavailable")
            return resultTransactions
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
                return resultTransactions
            }
            
            let decodedTransactions = try JSONDecoder().decode(TransactionRequest.self, from: data)
            
            decodedTransactions.records.forEach { record in
                resultTransactions.append(record.fields)
            }
            
            return resultTransactions
            
        } catch let error {
            print("Error:", error)
        }
        
        return resultTransactions
    }
    
}
