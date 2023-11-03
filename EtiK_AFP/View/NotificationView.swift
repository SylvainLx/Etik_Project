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
              
              NavigationView {
                  VStack {
                      TitleCard(title: "Mes notifications")
                      List() {
                          ForEach(notificationsList) { notification in
                              
                              NavigationLink(destination: {
                                  switch notification.name {
                                  case "Hermex":
                                      CreationView()
                                  case "Chemise 100% lin":
                                      CreationView()
                                  case "EtiK":
                                      CatalogueView()
                                  default:
                                      EmptyView()
                                  }
                              }) {
                                  
                                  VStack(alignment: .leading ){
                                      
                                      HStack{
                                          Image(notification.image)
                                              .resizable()
                                              .frame(width: 60, height: 60)
                                              .clipShape(Circle())
                                          VStack(alignment: .leading){
                                              Text(notification.name)
                                                  .font(.system(size: 17, weight: .bold))
                                              Text(notification.description).font(.system(size: 15))
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
                          
                      }  .scrollContentBackground(.hidden)
                          .listStyle(PlainListStyle())
                          .toolbar(.hidden, for: .tabBar)
                  }
              }
          }
      }
            
        #Preview {
                NotificationView()
            }
        


