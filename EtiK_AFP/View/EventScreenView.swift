//
//  EventScreenView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 24/10/2023.
//

import SwiftUI

struct EventScreenView: View {
    @State private var showingSheet = false
    
    var body: some View {
        
        NavigationStack{
            List{
                
                Button {
                    showingSheet.toggle()
                } label: {
                    
                    HStack{
                        Image(systemName: "teletype.answer")
                        
                        VStack(alignment: .leading){
                            Text("Event 1")
                            Text("Horaire : Time - Time")
                            Text("adresse : Place A Street B Country C")
                            
                        }
                    }
                    .sheet(isPresented: $showingSheet) {
                        DetailEventView()
                    }
                }
                
                HStack{
                    Image(systemName: "teletype.answer")
                    
                    VStack(alignment: .leading){
                        Text("Event 2")
                        Text("Horaire : Time - Time")
                        Text("adresse : Place A Street B Country C")
                    }
                }
                
                HStack{
                    Image(systemName: "teletype.answer")
                    
                    VStack(alignment: .leading){
                        Text("Event 3")
                        Text("Horaire : Time - Time")
                        Text("adresse : Place A Street B Country C")
                    }
                }
                
                HStack{
                    Image(systemName: "teletype.answer")
                    
                    VStack(alignment: .leading){
                        Text("Event 4")
                        Text("Horaire : Time - Time")
                        Text("adresse : Place A Street B Country C")
                    }
                }
            }
            .navigationTitle("Evènement")
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    EventScreenView()
}
