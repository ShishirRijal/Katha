//
//  User.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import Foundation
import FirebaseAuth

class FirebaseUser {
  let uid: String
  let email: String

  init(user: FirebaseAuth.User) {
    self.uid = user.uid
    self.email = user.email!
  }
}
