//
//  CardCollection.swift
//  EtiK
//
//  Created by Émilien Giraud on 20/10/2023.
//

import SwiftUI

struct CardCollection: View {

    @State var produit: Product

    var body: some View {

                ZStack() {

                    SmallCard()
                        .foregroundColor(.darkBeige)
                    VStack {
                        Text("Collection")
                            .font(.custom("Libre Franklin", size: 12))
                            .foregroundColor(.white)
                        Text(produit.collection[0])
                            .font(.custom("Italiana", size: 20))
                            .foregroundColor(.white)
                    }
                }


    }
}

//#Preview {
//    CardCollection()
//}
