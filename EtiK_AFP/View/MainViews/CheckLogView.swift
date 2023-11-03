//
//  CheckLogView.swift
//  EtiK_AFP
//
//  Created by Sylvain Leguay on 26/10/2023.
//

import SwiftUI

struct CheckLogView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel
    
    var body: some View {
        NavigationStack {
            if dataFilter.isLogged {
                ProfilView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    CheckLogView()
        .environmentObject(DataFilterModel())
}
