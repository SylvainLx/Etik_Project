//
//  ReturnArticleView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 20/10/2023.
//

import SwiftUI

struct ReturnArticleView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel


    var body: some View {
        NavigationStack {
            
                VStack {
                    TitleCard(title: "Mes retours")
                      
                    ScrollView {
                        ForEach(dataFilter.productsTransactionRef.transactionToProducts) { product in
                                NavigationLink(destination: CommandDetailView(name: product.name, category: product.category[0], type: product.collection[0], price: Int(product.price), numberOfOrder: Int(dataFilter.transactionRef.transaction[0].id) ?? 123456, productSize: "XS", progress: 100, statut: "En cours de traitement...", imgUrl: product.photo[0].url)) {
                                    CommandReturnCard(name: product.name, category: product.category[0], type: product.collection[0], price: Int(product.price), numberOfOrder: Int(dataFilter.transactionRef.transaction[0].id) ?? 123456, productSize: "XS", progress: 100, statut: "En cours de traitement...", imgUrl: product.photo[0].url)
                                }.foregroundColor(.black)
                            }
                        
                       
                }
                .padding(8)
            }
            Spacer()
        }
    }
}

#Preview {
    ReturnArticleView()
}
