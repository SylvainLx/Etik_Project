//
//  AppVersionView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 26/10/2023.
//

import SwiftUI

struct AppVersionView: View {
    
    var body: some View {
        
        VStack (spacing : 16){
            
            TitleCard(title: "Version d'application")
            ScrollView{
                
                Text("Version 1.001")
                
            }
            
        }
        
    }
}

#Preview {
    AppVersionView()
}
