//
//  AuthViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation
import FirebaseAuth


class AuthViewModel: ObservableObject {
    private let authService = AuthService()

    @Published var isLoginMode: Bool = false
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
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
        isLoading = true
        do {
            try await authService.register(email: email, password: password)
            isAuthenticated = true
            resetFields()
        } catch let error as NSError {
          let authError = AuthError.map(error)
          errorMessage = authError.description
          isError = true
        }
        isLoading = false
    }

    func logout() {
        do {
            try authService.logout()
            isAuthenticated = false
        } catch let error as NSError {
          let authError = AuthError.map(error)
          errorMessage = authError.description
          isError = true
        }
    }

  func fetchCurrentUser() -> FirebaseUser? {
    do {
        let user = try authService.getCurrentUser()
        return user
    } catch {
      errorMessage = "Failed to fetch current user: \(error.localizedDescription)"
      debugPrint("Error fetching current user: \(String(describing: errorMessage))")
      return nil
    }
  }

    func checkAuthentication()  {
          do {
              isLoading = true
              let user = try authService.getCurrentUser()
              isAuthenticated = (user != nil)
          } catch {
              errorMessage = "Failed to fetch current user: \(error.localizedDescription)"
              isError = true
              isAuthenticated = false
          }
          isLoading = false
      }


    private func resetFields() {
        email = ""
        password = ""
        errorMessage = nil
    }
}
