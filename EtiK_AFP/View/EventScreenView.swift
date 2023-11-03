//
//  EventScreenView.swift
//  EtiK_AFP
//
//  Created by apprenant62 on 24/10/2023.
//

import SwiftUI

struct EventScreenView: View {
    
    @EnvironmentObject var dataFilter: DataFilterModel
    @State private var showingSheet = false
    
    @EnvironmentObject var idFromEvent : EventObservable

    @State var selectedIndex : Int = 0
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(dataFilter.eventRequest.allEvents) { evenement in
                Button {
                    if let index = dataFilter.eventRequest.allEvents.firstIndex(where:{$0.id == evenement.id}) {
                        if dataFilter.eventRequest.allEvents[index].selectionEvent == true {
                            dataFilter.eventRequest.allEvents[index].selectionEvent = false
//                                if let favIndex = idFromEvent.event.firstIndex(where: {$0.id == evenement.id}) {}
                        }
                        else{
                            dataFilter.eventRequest.allEvents[index].selectionEvent = true
                            selectedIndex = index
                            
                            showingSheet.toggle()
                        }
                    }
                    
                    
                } label: {
                    
                    HStack{
                        ForEach(evenement.picture) { photo in
                            AsyncImage(url: URL(string: photo.url)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } else if phase.error != nil {
                                    Text("No image")
                                } else {
                                    ProgressView()
                                }
                                
                            }
                            .frame(width: 100)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading){
                                Text("\(evenement.name)")
                                Text("\(evenement.date)")
                                Text("\(evenement.adress)")
                                
                            }
                            .font(.custom("Italiana", size: 20))
                        }
                        .sheet(isPresented: $showingSheet) {
                            DetailEventView(index: selectedIndex)
                        }
                    }
                }
            }
            }
        }
        .navigationTitle("Evènement")
        .scrollContentBackground(.hidden)
        .listStyle(PlainListStyle())
    
        .onAppear {
            Task {
                dataFilter.eventRequest.allEvents = await dataFilter.eventRequest.fetchedEvent()
            }
        }
}
    
}
#Preview {
    EventScreenView()
        .environmentObject(DataFilterModel())
}
