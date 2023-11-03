//
//  CreateurFiltre.swift
//  EtiK
//
//  Created by Sylvain Leguay on 19/10/2023.
//

import SwiftUI

struct CreateurFiltre: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel
    
    @State var creator: Creator
    
    @State var destination:AnyView?
   
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(alignment: .center, spacing: 24) {
                SmallCreator(creator: creator)
                VStack(alignment: .leading) {
                    Text(creator.lastName)
                    Text(creator.firstName)
                    Text(creator.ville)
                }
                .font(.custom("LibreFranklin", size: 16))
                .fontWeight(.bold)
                StarView(note: 3)
                    .padding(.top, 36)
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    CreateurFiltre(creator: Creator(id: "", firstName: "", lastName: "", society: "", picture: [DataBaseImage](), email: "", password: "", role: "", biography: "", vegan: "", bio: "", madeInFrance: "", handMade: "", natural: "", upcycling: "", ville: "", adress: "", postalCode: "", events: "", products: "", transactions: "", products2: [String](), transactions2: [String](), events2: [String]()))
        .environmentObject(DataFilterModel())
}
