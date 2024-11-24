////
////  RegistrationViewModel.swift
////  Katha
////
////  Created by Shishir Rijal on 04/10/2024.
////
//import Foundation
//import FirebaseAuth
//
//class RegistrationViewModel: ObservableObject {
//    // Published properties to update the UI
//    @Published var fullName: String = ""
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
//    // Register user method
//    func register() async {
//        cleanupFields() // Reset fields before starting the registration
//        isLoading = true
//
//        do {
//            // Firebase registration
//            let response = try await Auth.auth().createUser(withEmail: email, password: password)
//            print("User registered: \(response)")
//            isLoading = false
//        } catch let error as NSError {
//            // Handle error and update UI
//            errorMessage = self.getErrorMessage(for: error)
//            isError = true
//            isLoading = false
//        }
//    }
//
//    // Reset user input fields and error message
//    private func cleanupFields() {
//        fullName = ""
//        email = ""
//        password = ""
//        errorMessage = nil
//    }
//
//    // Handle Firebase error messages
//    private func getErrorMessage(for error: NSError) -> String {
//        switch error.code {
//        case AuthErrorCode.emailAlreadyInUse.rawValue:
//            return "This email is already in use. Please use a different email."
//        case AuthErrorCode.invalidEmail.rawValue:
//            return "The email address is invalid. Please check and try again."
//        case AuthErrorCode.weakPassword.rawValue:
//            return "The password is too weak. Please use a stronger password."
//        default:
//            return "An unknown error occurred. Please try again later."
//        }
//    }
//}
