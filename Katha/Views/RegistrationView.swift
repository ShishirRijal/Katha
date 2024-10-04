//
//  RegistrationView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var registrationViewModel = RegistrationViewModel()

    var body: some View {
        
        NavigationView {
            VStack {
                
                // Back Button
                BackButton()
                
                // Title View
                TitleView()
                
                // Form
                RegistrationFormView(registrationViewModel: registrationViewModel)
                
                // Create Account Button
                CustomButton(title: "Create account") {
                    registrationViewModel.register()
                }
                
                Spacer()
                
                FooterView()

            }
            .padding()
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    
    //MARK: Title View
    private struct TitleView: View {
        var body: some View {
            VStack {
                Text("Medium")
                    .font(.logoFont())
                Spacer().frame(height: 20) // Space between the title and the next text
                Text("Sign up with email.")
                    .font(.custom(.playfairDisplayMedium, size: 30))
            }
        }
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
    
    // MARK: Registration Form
    private struct RegistrationFormView: View {
        // Binding to the registration view model to update the form fields
        @ObservedObject var registrationViewModel: RegistrationViewModel

        var body: some View {
            VStack(alignment: .leading) {
                Text("Your full name")
                CustomTextField(placeholder: "Shishir Rijal", text: $registrationViewModel.fullName)
                
                Spacer().frame(height: 25) // Space between input fields
                
                Text("Your email")
                CustomTextField(placeholder: "rijal.shishir@test.com", text: $registrationViewModel.email)
            }
            .font(.bodyFont()) // Set font for the input labels
            .padding(.vertical, 30) // Vertical padding around the form
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
    
}

#Preview {
    RegistrationView()
}






