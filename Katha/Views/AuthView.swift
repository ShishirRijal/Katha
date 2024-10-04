//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//


import SwiftUI

struct AuthView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
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
    var body: some View {
        Group {
            CustomLoginCard(name: "Google", icon: .google)
            CustomLoginCard(name: "Facebook", icon: .facebook)
            CustomLoginCard(name: "Apple", icon: .apple)
            CustomLoginCard(name: "Email", icon: .email)
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

private struct TermsView: View {
    var body: some View {
        VStack {
            Text("By signing up, you agree to our ")
                + Text("Terms of Service")
                    .underline()
                    .foregroundColor(.blue)
                + Text(" and acknowledge that our ")
                + Text("Privacy Policy")
                    .underline()
                    .foregroundColor(.blue)
                + Text(" applies to you.")
        }
        .multilineTextAlignment(.center)
    }
}

// MARK: - CustomLoginCard

struct CustomLoginCard: View {
    
    let name: String
    let icon: ImageResource
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Image(icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 25)
            Spacer()
            Text(viewModel.isLoginMode ? "Sign in with \(name)" : "Sign up with \(name)")
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(.primary, lineWidth: 2))
    }
}

#Preview {
    AuthView()
}
