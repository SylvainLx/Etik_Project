//
//  TestAPIView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 25/10/2023.
//

import SwiftUI

// ici, pour tester vos fichier APIRequest


struct TestAPIView: View {
    
    @EnvironmentObject var userRequest: UserAPIRequest
    
    
    var body: some View {
        NavigationStack {
            LazyVStack {
                ForEach(userRequest.allUser) { user in
                    Text(user.lastName)
                    Text(user.firstName)
                }
                Text("okokok")
            }
        }
    }
}

#Preview {
    TestAPIView()
        .environmentObject(UserAPIRequest())
}
