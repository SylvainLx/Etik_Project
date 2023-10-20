//
//  Date+Helpers.swift
//  EtiK_AFP
//
//  Created by Iris Gourvil on 20/10/2023.
//

import Foundation

extension Date {
    
    func descriptiveString(dateStyle: DateFormatter.Style = .short) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            return "Aujourd'hui"
        }
        else if daysBetween == 1 {
            return "Hier"
        }
        else if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday, from : self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
        return formatter.string(from: self)
    }
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        if let daysBetween = calendar.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
        
    }
}
