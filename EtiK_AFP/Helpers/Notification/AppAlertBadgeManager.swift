//
//  ContentView.swift
//  badgi
//
//  Created by Iris Gourvil on 31/10/2023.
//

import SwiftUI


protocol BadgeNumberProvidable: AnyObject {
    var applicationIconBadgeNumber: Int { get set }
}

extension UIApplication: BadgeNumberProvidable {}

actor AppAlertBadgeManager {
    
    let application: BadgeNumberProvidable
    
    init(application: BadgeNumberProvidable) {
        self.application = application
    }
    
    @MainActor
    func setAlertBadge(number: Int) {
        application.applicationIconBadgeNumber = number
        
        
    }
    
    @MainActor
    func resetAlertBadgetNumber() {
        application.applicationIconBadgeNumber = 0
    }
}
