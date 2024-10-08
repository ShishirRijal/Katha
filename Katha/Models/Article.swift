//
//  Article.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation


struct Article: Identifiable {
    var id = UUID()
    var author: String
    var authorImage: String
    var category: String?
    var title: String
    var introduction: String
    var date: String
    var claps: String
    var comments: String
    var thumbnail: String
    var memberOnly: Bool = false
    var tags: [String]?
    
}

let dummyArticles: [Article] = [
    Article(
        author: "Sandhya Sharma",
        authorImage: "author",
        category: "Data Science",
        title: "Mobile Developers Have Lost Their Glory, And Here's Why",
        introduction: "I recently saw this research published in indeed.com where the survey among developers showcased the...",
        date: "Jan 15",
        claps: "2.7K",
        comments: "1.3K",
        thumbnail: "thumbnail01",
        memberOnly: true,
        tags: ["ios", "Dev"]
    ),
    Article(
        author: "Ravi Thapa",
        authorImage: "author",
        title: "The Rise of Full-Stack Developers in 2024",
        introduction: "In recent years, full-stack developers have become an integral part of any development team...",
        date: "Feb 10",
        claps: "5.1K",
        comments: "900",
        thumbnail: "thumbnail02",
        tags: ["ios"]
    ),
    Article(
        author: "Anjali Maharjan",
        authorImage: "author",
        category: "Artificial Intelligence",
        title: "How AI is Transforming Healthcare",
        introduction: "Artificial intelligence is not just a buzzword anymore, it’s reshaping industries, particularly healthcare...",
        date: "Mar 05",
        claps: "3.5K",
        comments: "2.1K",
        thumbnail: "thumbnail03",
        memberOnly: true
    ),
    Article(
        author: "Binod Karki",
        authorImage: "author",
        category: "Machine Learning",
        title: "Deep Learning vs. Machine Learning: What's the Difference?",
        introduction: "Many people use the terms 'deep learning' and 'machine learning' interchangeably, but they are quite different...",
        date: "Mar 20",
        claps: "4.2K",
        comments: "1.5K",
        thumbnail: "thumbnail04",
        tags: ["ios", "Swift"]
    ),
    Article(
        author: "Sita Sharma",
        authorImage: "author",
        category: "Blockchain",
        title: "The Future of Blockchain in Financial Technology",
        introduction: "Blockchain has revolutionized how we think about finance and security. Here's why it's here to stay...",
        date: "Apr 12",
        claps: "6.3K",
        comments: "2.8K",
        thumbnail: "thumbnail01",
        memberOnly: true,
        tags: ["Dev"]
    ),
    Article(
        author: "Hari Adhikari",
        authorImage: "author",
        category: "Cybersecurity",
        title: "Top Cybersecurity Threats in 2024",
        introduction: "With more data being generated every second, cybersecurity threats are evolving faster than ever...",
        date: "May 02",
        claps: "3.7K",
        comments: "1.9K",
        thumbnail: "thumbnail02"
    ),
    Article(
        author: "Rajesh Kumar",
        authorImage: "author",
        category: "Cloud Computing",
        title: "Why Cloud-Native is the Future of Software Development",
        introduction: "Cloud-native architecture is gaining traction as businesses look for scalable, efficient, and flexible solutions...",
        date: "Jun 10",
        claps: "4.9K",
        comments: "1.7K",
        thumbnail: "thumbnail03",
        memberOnly: true
    ),
    Article(
        author: "Nisha Gurung",
        authorImage: "author",
        category: "DevOps",
        title: "How DevOps Accelerates Digital Transformation",
        introduction: "DevOps is not just a set of tools or processes—it's a culture shift that enables faster and more reliable software delivery...",
        date: "Jul 15",
        claps: "5.5K",
        comments: "1.8K",
        thumbnail: "thumbnail04",
        tags: ["ios", "Dev"]
    ),
    Article(
        author: "Ramesh Bhandari",
        authorImage: "author",
        category: "Mobile Development",
        title: "Building Cross-Platform Apps: Flutter vs. React Native",
        introduction: "Cross-platform development has become a crucial part of mobile app development. Here's how Flutter and React Native stack up...",
        date: "Aug 22",
        claps: "7.2K",
        comments: "3.1K",
        thumbnail: "thumbnail01"
    ),
    Article(
        author: "Manisha Dhakal",
        authorImage: "author",
        category: "UI/UX Design",
        title: "Why User Experience is More Important Than Ever",
        introduction: "In the digital age, users have come to expect seamless experiences from the products they interact with...",
        date: "Sep 30",
        claps: "8.5K",
        comments: "4.2K",
        thumbnail: "thumbnail02",
        memberOnly: true,
        tags: ["ios", "Dev"]
    )
]

