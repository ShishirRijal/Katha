//
//  User.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import Foundation
import FirebaseAuth

class UserModel: Codable {
    let id: String
    let email: String
    let fullName: String
    let photoURL: String
    let bio: String
    let followers: Int

    init(id: String, email: String, fullName: String, photoURL: String, bio: String, followers: Int) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.photoURL = photoURL
        self.bio = bio
        self.followers = followers
    }
}

let dummyUserModel: UserModel = UserModel(id: "uniqye_id", email: "ritch@gmail.com", fullName: "Ritchie Fredric", photoURL: "https://img.freepik.com/free-vector/smiling-redhaired-cartoon-boy_1308-174709.jpg", bio: "Mobile App Developer | ML Enthusiast", followers: 3478)
