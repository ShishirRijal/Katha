//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//
import SwiftUI

struct LoginView: View {

    @StateObject private var loginViewModel = LoginViewModel()
    @State private var isLoginSuccessful: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                BackButton()
                TitleView()

                Spacer().frame(height: 30)

                LoginForm(loginViewModel: loginViewModel)

                Spacer().frame(height: 30)

                CustomButton(
                    title: "Login",
                    isLoading: loginViewModel.isLoading
                ) {
                    Task {
                        await loginViewModel.login()
                        if !loginViewModel.isError {
                            isLoginSuccessful = true
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .alert(isPresented: $loginViewModel.isError) {
                Alert(
                    title: Text("Login Failed"),
                    message: Text(loginViewModel.getErrorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationDestination(isPresented: $isLoginSuccessful) {
                MainTabView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

private struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.black)
            }
            Spacer()
        }
    }
}

private struct TitleView: View {
    var body: some View {
        VStack {
            Text("Welcome Back")
                .font(.custom(.poppinsMedium, size: 30))
            Spacer().frame(height: 20)
            Text("Log in with your email.")
                .font(.custom(.poppinsRegular, size: 20))
        }
    }
}

private struct LoginForm: View {
    @ObservedObject var loginViewModel: LoginViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
            CustomTextField(placeholder: "your.email@example.com", text: $loginViewModel.email)

            Spacer().frame(height: 25)

            Text("Password")
            CustomSecureField(placeholder: "Enter your password", text: $loginViewModel.password)
        }
        .font(.bodyFont())
        .padding(.vertical, 10)
    }
}


#Preview {
    LoginView()
}
