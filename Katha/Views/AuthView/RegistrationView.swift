//
//  RegistrationView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            VStack {
                // Back Button
                BackButton()

                // Title View
                TitleView(title: "Medium", subtitle: "Sign up with email.")

                // Registration Form
              RegistrationForm()

                // Create Account Button
              CustomButton(title: "Create account", isLoading: authViewModel.isLoading) {
                  Task {
                      await authViewModel.register()
                      if authViewModel.isAuthenticated {
                      }
                  }
              }

                Spacer()

                // Footer View
                FooterView()

              Spacer()
            }
            .padding()
            .alert(isPresented: $authViewModel.isError) {
                Alert(
                    title: Text("Registration Failed"),
                    message: Text(authViewModel.getErrorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationDestination(isPresented: $authViewModel.isAuthenticated) {
                MainTabView() // Navigate to the MainTabView after registration
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

    // MARK: Footer View
    private struct FooterView: View {
        var body: some View {
            VStack {
                Text("By signing up, you agree to our ")
                + Text("Terms of Service")
                    .underline() // Underline the terms text
                + Text(" and acknowledge that our Privacy Policy applies to you.")
            }
            .font(.bodyFont(size: 12)) // Set font size for footer
            .multilineTextAlignment(.center) // Center align the footer text
        }
    }
    


#Preview {
    RegistrationView().environmentObject(AuthViewModel())
}






