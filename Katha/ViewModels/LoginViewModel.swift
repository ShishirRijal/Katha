////
////  LoginViewModel.swift
////  Katha
////
////  Created by Shishir Rijal on 04/10/2024.
////
//import Foundation
//import FirebaseAuth
//
//class LoginViewModel: ObservableObject {
//
//    @Published var email: String = ""
//    @Published var password: String = ""
//    @Published var errorMessage: String? = nil
//    @Published var isLoading: Bool = false
//    @Published var isError: Bool = false
//
//    // Computed property for error message
//    var getErrorMessage: String {
//        return errorMessage ?? "An unknown error occurred!"
//    }
//
//    // Perform login
//    func login() async {
//        isLoading = true // Start loading
//
//        do {
//            // Firebase login attempt
//            let response = try await Auth.auth().signIn(withEmail: email, password: password)
//            print("User logged in: \(response)")
//            errorMessage = nil
//            isError = false
//        } catch let error as NSError {
//            // Handle Firebase errors
//            errorMessage = self.getErrorMessage(for: error)
//            isError = true
//        }
//
//        isLoading = false // Stop loading
//    }
//
//    // Map Firebase error codes to user-friendly messages
//    private func getErrorMessage(for error: NSError) -> String {
//        switch error.code {
//        case AuthErrorCode.invalidEmail.rawValue:
//            return "The email address is invalid. Please check and try again."
//        case AuthErrorCode.wrongPassword.rawValue:
//            return "Incorrect password. Please try again."
//        case AuthErrorCode.userNotFound.rawValue:
//            return "No account found for this email. Please sign up."
//        case AuthErrorCode.networkError.rawValue:
//            return "Network error. Please check your connection and try again."
//        default:
//            return "An unknown error occurred. Please try again later."
//        }
//    }
//}
