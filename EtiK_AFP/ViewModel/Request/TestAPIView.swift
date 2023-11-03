//
//  TestAPIView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import SwiftUI

// ici, pour tester vos fichier APIRequest


struct TestAPIView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel
    
    
    var body: some View {
        NavigationStack {
            LazyVStack {
                ForEach(dataFilter.creatorRequest.allCreator) { creator in
                    Text(creator.lastName)
                    Text(creator.firstName)
                }
                Text("okokok")
            }
        }
        .environmentObject(dataFilter)
    }
}

#Preview {
    TestAPIView()
        .environmentObject(DataFilterModel())
}
