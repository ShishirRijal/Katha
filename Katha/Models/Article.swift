//
//  Article.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation


struct Article: Identifiable {
    var id = UUID()
    var author: Author
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
        author: authors[0],
        category: "Data Science",
        title: "Mobile Developers Have Lost Their Glory, And Here's Why",
        introduction: """
        I recently saw this research published in indeed.com where the survey among developers showcased the
        shifting landscape of mobile development. The rise of web applications and cross-platform frameworks
        has changed the perception of mobile developers, who now find themselves at a crossroads.

        In this article, I will explore the reasons behind this shift and what it means for aspiring mobile developers.
        """,
        date: "Jan 15",
        claps: "2.7K",
        comments: "1.3K",
        thumbnail: "thumbnail01",
        memberOnly: true,
        tags: ["iOS", "Mobile Development"]
    ),
    Article(
        author: authors[1],
        title: "The Rise of Full-Stack Developers in 2024",
        introduction: """
        In recent years, full-stack developers have become an integral part of any development team.
        Their ability to work on both the front-end and back-end of applications allows for greater flexibility and
        efficiency in project development.

        This article discusses the skills necessary to become a full-stack developer and the opportunities available
        in the job market for these versatile professionals.
        """,
        date: "Feb 10",
        claps: "5.1K",
        comments: "900",
        thumbnail: "thumbnail02",
        tags: ["Full-Stack Development", "Web Development"]
    ),
    Article(
        author: authors[2],
        category: "Artificial Intelligence",
        title: "How AI is Transforming Healthcare",
        introduction: """
        Artificial intelligence is not just a buzzword anymore; it’s reshaping industries, particularly healthcare.
        From diagnostics to personalized treatment plans, AI is making a significant impact on how we approach health.

        In this article, I will discuss the various applications of AI in healthcare and its potential to revolutionize
        patient care.
        """,
        date: "Mar 05",
        claps: "3.5K",
        comments: "2.1K",
        thumbnail: "thumbnail03",
        memberOnly: true,
        tags: ["AI", "Healthcare"]
    ),
    Article(
        author: authors[3],
        category: "Machine Learning",
        title: "Deep Learning vs. Machine Learning: What's the Difference?",
        introduction: """
        Many people use the terms 'deep learning' and 'machine learning' interchangeably, but they are quite different.
        While deep learning is a subset of machine learning, it has unique characteristics that set it apart.

        In this article, I will break down the differences between these two fields and explain why understanding them
        is crucial for aspiring data scientists.
        """,
        date: "Mar 20",
        claps: "4.2K",
        comments: "1.5K",
        thumbnail: "thumbnail04",
        tags: ["Machine Learning", "Data Science"]
    ),
    Article(
        author: authors[4],
        category: "Blockchain",
        title: "The Future of Blockchain in Financial Technology",
        introduction: """
        Blockchain has revolutionized how we think about finance and security. Its decentralized nature allows for
        greater transparency and trust in transactions.

        In this article, I will discuss how blockchain technology is being integrated into financial services and
        what the future holds for this transformative technology.
        """,
        date: "Apr 12",
        claps: "6.3K",
        comments: "2.8K",
        thumbnail: "thumbnail01",
        memberOnly: true,
        tags: ["Blockchain", "FinTech"]
    ),
    Article(
        author: authors[5],
        category: "Cybersecurity",
        title: "Top Cybersecurity Threats in 2024",
        introduction: """
        With more data being generated every second, cybersecurity threats are evolving faster than ever.
        In 2024, businesses face a myriad of challenges, from ransomware attacks to data breaches.

        This article explores the top cybersecurity threats of the year and offers strategies for organizations
        to protect themselves against these risks.
        """,
        date: "May 02",
        claps: "3.7K",
        comments: "1.9K",
        thumbnail: "thumbnail02",
        tags: ["Cybersecurity", "Data Protection"]
    ),
    Article(
        author: authors[6],
        category: "Cloud Computing",
        title: "Why Cloud-Native is the Future of Software Development",
        introduction: """
        Cloud-native architecture is gaining traction as businesses look for scalable, efficient, and flexible solutions.
        This approach enables organizations to leverage the full power of cloud computing, fostering innovation and agility.

        In this article, I will discuss the principles of cloud-native development and how they can transform
        software delivery.
        """,
        date: "Jun 10",
        claps: "4.9K",
        comments: "1.7K",
        thumbnail: "thumbnail03",
        memberOnly: true,
        tags: ["Cloud Computing", "Software Development"]
    ),
    Article(
        author: authors[7],
        category: "DevOps",
        title: "How DevOps Accelerates Digital Transformation",
        introduction: """
        DevOps is not just a set of tools or processes; it's a culture shift that enables faster and more reliable
        software delivery. By fostering collaboration between development and operations teams, organizations can
        achieve their digital transformation goals more effectively.

        This article explores how adopting a DevOps approach can lead to significant improvements in productivity
        and quality.
        """,
        date: "Jul 15",
        claps: "5.5K",
        comments: "1.8K",
        thumbnail: "thumbnail04",
        tags: ["DevOps", "Digital Transformation"]
    ),
    Article(
        author: authors[8],
        category: "Mobile Development",
        title: "Building Cross-Platform Apps: Flutter vs. React Native",
        introduction: """
        Cross-platform development has become a crucial part of mobile app development.
        With frameworks like Flutter and React Native gaining popularity, developers are faced with the challenge
        of choosing the right tool for their needs.

        In this article, I will compare both frameworks, highlighting their strengths and weaknesses
        to help you make an informed decision.
        """,
        date: "Aug 22",
        claps: "7.2K",
        comments: "3.1K",
        thumbnail: "thumbnail01",
        tags: ["Mobile Development", "Cross-Platform"]
    ),
    Article(
        author: authors[9],
        category: "UI/UX Design",
        title: "Why User Experience is More Important Than Ever",
        introduction: """
        In the digital age, users have come to expect seamless experiences from the products they interact with.
        Prioritizing user experience (UX) is essential for businesses looking to stay competitive.

        This article discusses the importance of UX design and how it can significantly impact customer satisfaction
        and retention.
        """,
        date: "Sep 30",
        claps: "8.5K",
        comments: "4.2K",
        thumbnail: "thumbnail02",
        memberOnly: true,
        tags: ["UI/UX", "User Experience"]
    )
]
