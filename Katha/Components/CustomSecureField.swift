//
//  CustomSecureField.swift
//  Katha
//
//  Created by Shishir Rijal on 24/11/2024.
//

import SwiftUI

struct CustomSecureField: View {
    let placeholder: String
    @Binding var text: String
    var fontSize: CGFloat = 18
    var backgroundColor: Color = Color.gray.opacity(0.2)

    var body: some View {
        SecureField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .padding()
            .background(backgroundColor)
            .cornerRadius(5)
            .font(.system(size: fontSize))
    }
}

#Preview {
    return CustomSecureField(
        placeholder: "Create a strong password",
        text: .constant("")
    )
}
