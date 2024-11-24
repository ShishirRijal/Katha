//
//  User.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import Foundation

class FirebaseUser {
  let uid: String
  let email: String

  init(uid: String, email: String) {
    self.uid = uid
    self.email = email
  }
}
