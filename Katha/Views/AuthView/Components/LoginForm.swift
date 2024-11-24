//
//  LoginForm.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import SwiftUI

/// Login form for email/password input
struct LoginForm: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
            CustomTextField(placeholder: "your.email@example.com", text: $authViewModel.email)

            Spacer().frame(height: 25)

            Text("Password")
            CustomSecureField(placeholder: "Enter your password", text: $authViewModel.password)
        }
        .font(.bodyFont())
        .padding(.vertical, 10)
    }
}

// MARK: Preview
#Preview {
    LoginForm().environmentObject(AuthViewModel())
}
