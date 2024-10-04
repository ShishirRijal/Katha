//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                BackButton()
                
                TitleView()
                
                Spacer()
                    .frame(height: 30)
                
                VStack(alignment: .leading) {
                    Text("Your email")
                        
                    CustomTextField(placeholder: "rijal.shishir@test.com", text: $loginViewModel.email)
                }
                
                Spacer()
                    .frame(height: 30)
                
                CustomButton(title: "Continue") {
                    loginViewModel.login()
                }
                
                Spacer()
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    // MARK: BackButton
    private struct BackButton: View {
        var body: some View {
            HStack {
                NavigationLink(destination: AuthView()) {
                    Image(systemName: "chevron.left") // Back icon
                        .font(.title) // Adjust the size of the icon
                        .foregroundColor(.black) // Set the icon color to black
                }
                Spacer() // Spacer to push the button to the left
            }
        }
    }
    
    //MARK: Title View
    private struct TitleView: View {
        var body: some View {
            VStack {
                Text("Medium")
                    .font(.logoFont())
                Spacer().frame(height: 20) // Space between the title and the next text
                Text("Sign in with email.")
                    .font(.custom(.playfairDisplayMedium, size: 30))
            }
        }
    }
    
}

#Preview {
    LoginView()
}
