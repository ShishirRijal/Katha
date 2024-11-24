//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//


import SwiftUI

/// Entry point for Authentication flows
struct AuthView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    HeaderView()
                    DescriptionView()
                    LoginOptionsView()
                    AccountToggleView()
                    if !authViewModel.isLoginMode {
                        TermsView()
                    }
                }
                .padding()
            }
            .environmentObject(authViewModel)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: Preview
#Preview {
  AuthView().environmentObject(AuthViewModel())
}

// MARK: - Subviews

private struct HeaderView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 10)
            Text("Medium")
                .font(.logoFont())
            Spacer().frame(height: 30)
            Text("Human\nstories and\nideas.")
                .scaledToFit()
                .font(.custom(.playfairDisplayMedium, size: 60))
                .multilineTextAlignment(.center)
            Spacer().frame(height: 20)
        }
    }
}

private struct DescriptionView: View {
    var body: some View {
        Text("Discover perspectives that deepen understanding.")
            .font(.bodyFont())
            .multilineTextAlignment(.center)
            .padding(.bottom, 30)
    }
}

private struct LoginOptionsView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {

        Group {
            CustomLoginCard(name: "Google", icon: .google)
            
            CustomLoginCard(name: "Facbook", icon: .facebook)

            CustomLoginCard(name: "Apple", icon: .facebook)
            
            NavigationLink(destination: authViewModel.isLoginMode ? AnyView(LoginView()) : AnyView(RegistrationView())) {
                CustomLoginCard(name: "Email", icon: .email)
            }
            
        }
        .padding(.bottom, 5)
    }
}


private struct AccountToggleView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text(authViewModel.isLoginMode ? "Don't have an account? " : "Already have an account? ")
                + Text(authViewModel.isLoginMode ? "Sign up." : "Sign in.")
                .underline()
                .foregroundColor(.green)
        }
        .multilineTextAlignment(.center)
        .onTapGesture {
            authViewModel.toggleLoginState()
        }
        .padding(.vertical, 30)
    }
}


