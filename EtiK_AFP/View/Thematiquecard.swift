//
//  Thematiquecard.swift
//  EtiK_AFP
//
//  Created by apprenant48 on 20/10/2023.
//

import SwiftUI

struct Thematiquecard: View {
    var body: some View {
        
        NavigationLink(destination: CatalogueView(filtre: "Halloween")) {
            ZStack {
                
                Image("halloween")
                    .resizable()
            }
            .frame(width: 400, height: 150)
        }
    }
}

struct Thematiquecard2: View {
    var body: some View {
        NavigationLink(destination: CatalogueView(filtre: "Noel")) {
            ZStack {
                Image("merry-christmas")
                    .resizable()
            }
            .frame(width: 400, height: 150)
        }
        
    }
}

struct Thematiquecard3: View {
    var body: some View {
        NavigationLink(destination: CatalogueView(filtre: "2024")) {
            ZStack {
                Image("happynewyear")
                    .resizable()
                
            }
            .frame(width: 400, height: 150)
        }
    }
}

#Preview {
    VStack {
        Thematiquecard()
        Thematiquecard2()
        Thematiquecard3()
    }
}
