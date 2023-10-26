//
//  AboutView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 25/10/2023.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                NavigationLink("Termes d'utilisation", destination: TermsOfServiceView())
                
                NavigationLink("Régulations EU", destination: EURegulationView())
                
                NavigationLink("Version de l'application", destination: AppVersionView())
                
            }
            .navigationTitle("A propos")
        }
        
    }
}

#Preview {
    AboutView()
}
