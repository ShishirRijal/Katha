//
//  AuthViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation
import FirebaseAuth
import UIKit


class AuthViewModel: ObservableObject {
    private let authService = AuthService()

    @Published var isLoginMode: Bool = false
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var bio: String = ""
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var isAuthenticated: Bool = false
    

    // Computed property for error message
    var getErrorMessage: String {
        return errorMessage ?? "An unknown error occurred!"
    }

    func toggleLoginState() {
        isLoginMode.toggle()
    }

    func login() async {
        print("login executed")
        isLoading = true
        do {
              try await authService.login(email: email, password: password)
              isAuthenticated = true
              resetFields()
        } catch let error as NSError {
          print(error)
              let authError = AuthError.map(error)
              errorMessage = authError.description
              isError = true
        }
        isLoading = false
    }

  func register() async {
      print("register executed")
      isLoading = true
      print("Registration started for email: \(email)")
      do {
          try await authService.register(email: email, password: password, fullName: fullName, bio: bio)
          print("Registration successful for email: \(email)")
          isAuthenticated = true
          resetFields()
      } catch let error as ValidationError {
          print("Validation error during registration: \(error.localizedDescription)")
          showError(error.localizedDescription)
      } catch {
          print("Unknown registration error: \(error.localizedDescription)")
          showError("An unknown error occurred. Please try again.")
      }
      isLoading = false
      print("Registration process completed")
  }

    func logout() {
        do {
            try authService.logout()
            isAuthenticated = false
            print("Logout successful!")
        } catch let error as NSError {
          let authError = AuthError.map(error)
          errorMessage = authError.description
          isError = true
        }
    }

//  func fetchCurrentUser() -> FirebaseUser? {
//      do {
//          if let user = try authService.getCurrentUser() {
//              return user
//          } else {
//              errorMessage = "No current user found."
//              return nil
//          }
//      } catch {
//          errorMessage = "Failed to fetch current user: \(error.localizedDescription)"
//          debugPrint("Error fetching current user: \(String(describing: errorMessage))")
//          return nil
//      }
//  }



  func checkAuthentication() {
//      do {
          isLoading = true
            guard let uid =  Auth.auth().currentUser?.uid else {
                isAuthenticated = false
                isLoading = false
                return
        }
        isAuthenticated = true
//          if let user = try authService.fetchUserProfile(uid: String, ) {
//              isAuthenticated = true
//          } else {
//              isAuthenticated = false
//          }
//      } catch {
//          errorMessage = "Failed to fetch current user: \(error.localizedDescription)"
//          isError = true
//          isAuthenticated = false
//      }
        isLoading = false
  }



    private func resetFields() {
        fullName = ""
        bio = ""
        email = ""
        password = ""
        errorMessage = nil
    }

  private func isValidEmail(_ email: String) -> Bool {
      let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
      return emailPredicate.evaluate(with: email)
  }

  private func validateRegistrationFields() throws {
      guard !email.isEmpty else { throw ValidationError("Email is required.") }
      guard isValidEmail(email) else { throw ValidationError("Please enter a valid email address.") }
      guard !password.isEmpty else { throw ValidationError("Password is required.") }
      guard password.count >= 6 else { throw ValidationError("Password must be at least 6 characters long.") }
      guard !fullName.isEmpty else { throw ValidationError("Full name is required.") }
      guard !bio.isEmpty else { throw ValidationError("Bio is required.") }
  }


  struct ValidationError: LocalizedError {
      private let message: String
      init(_ message: String) {
          self.message = message
      }

      var errorDescription: String? {
          return message
      }
  }


  private func showError(_ message: String) {
      errorMessage = message
      isError = true
  }


}


