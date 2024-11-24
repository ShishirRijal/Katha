//
//  RegistrationForm.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import SwiftUI

/// Registration form for new account details
struct RegistrationForm: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Full Name")
            CustomTextField(placeholder: "Shishir Rijal", text: $authViewModel.fullName)

            Spacer().frame(height: 25)

            Text("Email")
            CustomTextField(placeholder: "rijal.shishir@test.com", text: $authViewModel.email)

            Spacer().frame(height: 25)

            Text("Password")
            CustomSecureField(placeholder: "Create a strong password", text: $authViewModel.password)
        }
        .font(.bodyFont())
        .padding(.vertical, 10)
    }
}

// MARK: Preview
#Preview {
    RegistrationForm().environmentObject(AuthViewModel())
}
