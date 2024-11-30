//
//  AuthService.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class AuthService {
    private let db = Firestore.firestore()

    // Login user
    func login(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }

    // Register user
    func register(email: String, password: String, fullName: String, bio: String) async throws {
        // Create user in Firebase
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let user = authResult.user

        // Since firebase storage is premium plan, I'm just using a dummy image for image field as of now
        let photoUrl = uploadImage()
        let followers = getFollowers()
        // Save user details to Firestore
        let userData: [String: Any] = [
            "id": user.uid,
            "email": email,
            "fullName": fullName,
            "photoURL": photoUrl,
            "followers": followers,
            "bio": bio
        ]
        try await db.collection("users").document(user.uid).setData(userData)
    }

    // Logout user
    func logout() throws {
        try Auth.auth().signOut()
    }

    // Check if user is logged in
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }

    // Get currently loggedin user id
    func getUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }

    private func getFollowers(min: Int = 250, max: Int = 100000) -> Int {
        guard min < max else {
            print("Invalid range: min must be less than max.")
            return min
        }
        return Int.random(in: min...max)
    }
    
    private func uploadImage() -> String {
        return "https://img.freepik.com/free-vector/smiling-redhaired-cartoon-boy_1308-174709.jpg"
    }


}
