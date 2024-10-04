//
//  CustomTextField.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI


struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var fontSize: CGFloat = 18
    var backgroundColor: Color = Color.gray.opacity(0.2)

    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .padding()
            .background(backgroundColor)
            .cornerRadius(5)
            .font(.bodyFont(size: fontSize))
            .autocapitalization(.words)
    }
}


#Preview {
    @State var text: String = ""
    return CustomTextField(placeholder: "Placeholder", text:$text )
}
