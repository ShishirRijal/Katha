//
//  String.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation

extension String {
    /// Calculates the estimated reading time in minutes based on content length.
    /// - Parameter wordsPerMinute: The average words a person can read per minute (default is 200).
    /// - Returns: The estimated reading time in minutes as an integer.
    func estimatedReadingTime(wordsPerMinute: Int = 200) -> Int {
        let wordCount = self.split { $0.isWhitespace }.count
        let minutes = Double(wordCount) / Double(wordsPerMinute)
        return max(1, Int(ceil(minutes))) // Always at least 1 minute
    }
}
