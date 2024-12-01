//
//  RegistrationView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI
import UIKit


struct RegistrationView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    private var imageHeight: Double = 100.0

    var body: some View {
        NavigationStack {
            VStack {
                BackButton()
                ScrollView {
                    VStack {
                        TitleView(title: "KATHA", subtitle: "Sign up with email.")

                        RegistrationForm()

                        CustomButton(title: "Create account", isLoading: authViewModel.isLoading) {
                            print("User clicked Create Account")
                            Task {
                                await authViewModel.register()
                                if authViewModel.isAuthenticated {
                                    print("Registration completed successfully")
                                }
                            }
                        }

                        Spacer()
                        FooterView()
                        Spacer()
                    }
                    .alert(isPresented: $authViewModel.isError) {
                        Alert(
                            title: Text("Registration Failed"),
                            message: Text(authViewModel.getErrorMessage),
                            dismissButton: .default(Text("OK"), action: {
                                print("Alert dismissed")
                            })
                        )
                    }
                    .navigationDestination(isPresented: $authViewModel.isAuthenticated) {
                        MainTabView()
                    }
                }
            }.padding()
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
        .preferredColorScheme(.dark)
}
