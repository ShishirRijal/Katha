//
//  Author.swift
//  Katha
//
//  Created by Shishir Rijal on 08/10/2024.
//

import Foundation

struct Author: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var followers: Int
    var bio: String
}


let authors: [Author] = [
    Author(
        image: "author",
        name: "Shishir Rijal",
        followers: 673,
        bio: "A passionate software developer specializing in mobile and web applications, with a keen interest in SwiftUI and Flutter. Currently pursuing a master’s degree, I explore the intersection of technology and creativity through deep learning and natural language processing."
    ),
    
    Author(
         image: "author1",
         name: "Ravi Thapa",
         followers: 1200,
         bio: "Full-stack developer dedicated to building intuitive and robust applications."
     ),
     Author(
         image: "author3",
         name: "Anjali Maharjan",
         followers: 2000,
         bio: "AI researcher exploring the transformative power of technology in healthcare."
     ),
     Author(
         image: "author2",
         name: "Binod Karki",
         followers: 900,
         bio: "Machine learning advocate passionate about educating others on the topic."
     ),
     Author(
         image: "author5",
         name: "Sita Sharma",
         followers: 1800,
         bio: "Blockchain enthusiast focused on financial technology and security."
     ),
     Author(
         image: "author4",
         name: "Hari Adhikari",
         followers: 1100,
         bio: "Cybersecurity expert committed to raising awareness about online threats."
     ),
     Author(
         image: "author1",
         name: "Rajesh Kumar",
         followers: 950,
         bio: "Cloud computing specialist dedicated to helping businesses transition to the cloud."
     ),
     Author(
         image: "author6",
         name: "Nisha Gurung",
         followers: 1600,
         bio: "DevOps advocate passionate about improving collaboration between development and operations."
     ),
     Author(
         image: "author4",
         name: "Ramesh Bhandari",
         followers: 1300,
         bio: "Mobile developer focusing on cross-platform solutions to enhance user engagement."
     ),
     Author(
         image: "author5",
         name: "Manisha Dhakal",
         followers: 1400,
         bio: "UI/UX designer committed to creating user-centered designs for modern applications."
     )
]
