//
//  AuthService.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import FirebaseAuth

class AuthService {

    // Login user
    func login(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }

    // Register user
    func register(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }

    // Logout user
    func logout() throws {
        try Auth.auth().signOut()
    }

    // Check if user is logged in
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }

    // Get currently logged in user
  func getCurrentUser()  throws -> FirebaseUser? {
    guard let user = Auth.auth().currentUser else {
        return nil // No user is logged in
    }
    return FirebaseUser(user: user)
  }
}
