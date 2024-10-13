//
//  Date.swift
//  Katha
//
//  Created by Shishir Rijal on 08/10/2024.
//

import Foundation


extension Date {
    func timeAgoDisplay() -> String {
            let calendar = Calendar.current
            let currentDate = Date()
            
            // Calculate the components from the date
            let components = calendar.dateComponents([.year, .month, .day], from: self, to: currentDate)

            // Check for years
            if let years = components.year, years > 0 {
                return "\(years) year\(years == 1 ? "" : "s") ago"
            }
            
            // Check for months
            if let months = components.month, months > 0 {
                return "\(months) month\(months == 1 ? "" : "s") ago"
            }
            
            // Check for days
            if let days = components.day, days > 0 {
                return "\(days) day\(days == 1 ? "" : "s") ago"
            }
            
            // Check for hours
            if let hours = calendar.dateComponents([.hour], from: self, to: currentDate).hour, hours > 0 {
                return "\(hours) hour\(hours == 1 ? "" : "s") ago"
            }
            
            // Check for minutes
            if let minutes = calendar.dateComponents([.minute], from: self, to: currentDate).minute, minutes > 0 {
                return "\(minutes) minute\(minutes == 1 ? "" : "s") ago"
            }

            return "Just now"
        }
    
    func toMonthAndDayFormat(shortMonth: Bool = false) -> String {
            let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = shortMonth ? "MMM dd" : "MMMM dd" // Full month name and day
            return dateFormatter.string(from: self)
        }
}

// Example usage
//let articleDate = dummyArticles[0].date
//let timeSincePublished = articleDate.timeAgoDisplay()
//print(timeSincePublished) // Outputs something like "3 days ago" based on the current date
