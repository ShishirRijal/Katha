//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            VStack {
                BackButton()
                TitleView(title: "Welcome Back", subtitle: "Log in with your email.")

                Spacer().frame(height: 30)

                LoginForm()

                Spacer().frame(height: 30)

                CustomButton(
                    title: "Login",
                    isLoading: authViewModel.isLoading
                ) {
                    Task {
                        await authViewModel.login()
                    }
                }

                Spacer()
            }
            .padding()
            .alert(isPresented: $authViewModel.isError) {
                Alert(
                    title: Text("Login Failed"),
                    message: Text(authViewModel.getErrorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationDestination(isPresented: $authViewModel.isAuthenticated) {
                MainTabView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    LoginView().environmentObject(AuthViewModel())
}
