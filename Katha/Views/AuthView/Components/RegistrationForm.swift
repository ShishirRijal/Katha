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
                .autocapitalization(.words)

          Spacer().frame(height: 25)

          Text("Your Bio")
          CustomTextField(placeholder: "iOS App Developer", text: $authViewModel.bio)


            Spacer().frame(height: 25)

            Text("Email")
            CustomTextField(placeholder: "rijal.shishir@test.com", text: $authViewModel.email)
                .autocapitalization(.none)

            Spacer().frame(height: 25)

            Text("Password")
            CustomSecureField(placeholder: "Create a strong password", text: $authViewModel.password)
                .autocorrectionDisabled()
                .autocapitalization(.none)
        }
        .font(.bodyFont())
        .padding(.vertical, 10)
    }
}

// MARK: Preview
#Preview {
    RegistrationForm().environmentObject(AuthViewModel())
}
