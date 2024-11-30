//
//  User.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import Foundation
import FirebaseAuth

class FirebaseUser: Codable {
    let uid: String
    let email: String
    let fullName: String
    let photoURL: String
    let bio: String

    init(uid: String, email: String, fullName: String, photoURL: String, bio: String) {
        self.uid = uid
        self.email = email
        self.fullName = fullName
        self.photoURL = photoURL
        self.bio = bio
    }
}

