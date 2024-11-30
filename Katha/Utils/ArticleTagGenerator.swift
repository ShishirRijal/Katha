//
//  ArticleTagGenerator.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation

struct ArticleTagGenerator {
    private static let allTags = [
        "Programming", "iOS", "Swift", "Technology", "AI", "Machine Learning",
        "Productivity", "Web Development", "Data Science", "Startup", "JavaScript",
        "Mobile Development", "Design", "Python", "Cloud Computing", "DevOps",
        "Blockchain", "Gaming", "Cybersecurity", "Creativity", "Entrepreneurship",
        "Health", "Education", "Remote Work", "Leadership", "UX/UI"
    ]

    /// Generates random tags for an article
    /// - Parameter count: Number of random tags to generate (default is 3)
    /// - Returns: An array of unique random tags
    static func generateTags(count: Int = 3) -> [String] {
        guard count > 0 else { return [] }
        let shuffledTags = allTags.shuffled()
        return Array(shuffledTags.prefix(count))
    }
}
