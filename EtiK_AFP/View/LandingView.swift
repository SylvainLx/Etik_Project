//
//  ContentView.swift
//  EtiK
//
//  Created by Émilien Giraud on 19/10/2023.
//

import SwiftUI

struct LandingView: View {
    
    @StateObject var dataFilter = DataFilterModel()
    @StateObject var panier = Panier()
        
    @State var selection = 1
    
    @State var badgeManager = AppAlertBadgeManager(application: UIApplication.shared)

    var body: some View {
        
        TabView(selection: $selection) {
            CreationView()
                .tabItem { Label("Créations", systemImage: "sun.max") }
                .tag(1)
            EventView()
                .tabItem { Label("Évènements", systemImage: "calendar") }
                .tag(2)
            FavorisView()
                .tabItem { Label("Favoris", systemImage: "heart") }
                .tag(3)
            PanierView(tab: $selection)
                .tabItem { Label("Panier", systemImage: "basket") }
                .badge(panier.Panier.count)
                .tag(4)
            CheckLogView()
                .tabItem { Label("Profil", systemImage: "person") }
                .tag(5)
        }.accentColor(.marron)
            .environmentObject(dataFilter)
            .environmentObject(panier)

            .onAppear {
                Task {
                    dataFilter.userRequest.allUser = await dataFilter.userRequest.fetchedUser()
                    dataFilter.productsRequest.allProducts = await dataFilter.productsRequest.fetchedProducts()
                    dataFilter.transactionsRequest.allTransaction = await dataFilter.transactionsRequest.fetchedTransaction()
                    dataFilter.eventRequest.allEvents = await dataFilter.eventRequest.fetchedEvent()
                    dataFilter.creatorRequest.allCreator = await dataFilter.creatorRequest.fetchedCreator()
                }
                // correct the transparency bug for Tab bars
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithOpaqueBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                
                badgeManager.setAlertBadge(number: 4)
                //notification badge AppIcon
                UNUserNotificationCenter.current().requestAuthorization(options: .badge) // Mark 1
                                 { (_, _) in }
            }
    }
}

#Preview {
    LandingView()
        .environmentObject(DataFilterModel())
        .environmentObject(Panier())
}
