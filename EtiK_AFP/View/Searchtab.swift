//
//  Searchtab.swift
//  EtiK_AFP
//
//  Created by apprenant48 on 20/10/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        NavigationStack {
        }
        .searchable(text: $searchText, prompt: "Veuillez taper votre recherche ici")

        }
    }


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
