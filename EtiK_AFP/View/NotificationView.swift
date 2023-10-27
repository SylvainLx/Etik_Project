//
//  NotificationView.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 27/10/2023.
//

import SwiftUI


    struct NotificationView: View {
        
        
        @State var  notificationsList = Notification.notificationsList
        
        mutating func deleteNotification(at offsets: IndexSet) {
            notificationsList.remove(atOffsets: offsets)
            }
        
        var body: some View {
            
            NavigationView{
                List() {
                    ForEach(notificationsList) { Notification in
                        
                        NavigationLink( destination : {
                            if Notification.name == "Hermex" {
                                CreationView() }
                            if Notification.name == "Chemise 100% lin" {
                               DetailProduit() }
                            if Notification.name == "EtiK" {
                                CatalogueView()
                            }}){
                                
                                
                                VStack(alignment: .leading ){
                                    
                                    HStack{
                                        Image(Notification.image)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                        VStack(alignment: .leading){
                                            Text(Notification.name)
                                                .font(.system(size: 17, weight: .bold))
                                            Text(Notification.description).font(.system(size: 15))
                                            
                                            
                                            
                                                
                                       
                                        }
                                        //.onDelete(perform: deleteNotification(IndexSet))
                                    
                                     .scrollContentBackground(.hidden)
                                    
                                    .listStyle(PlainListStyle())
                                    
                                }
                                
                                    
                                }
                                
                            }
                        
                    }
                    .onDelete(perform: { indexSet in
                        notificationsList.remove(atOffsets: indexSet)
                    })
                    
                }
                
            }
            
        }
    }

            
        #Preview {
                NotificationView()
            }
        


