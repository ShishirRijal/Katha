//
//  CustomButton.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    let backgroundColor: Color = .theme.accent
    let foregroundColor: Color = .theme.white

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(.poppinsMedium, size: 16))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(40)
                .shadow(radius: 5)
        }
//        .padding(.horizontal)
    }
}

#Preview {
    CustomButton(title: "Register Now") {
        //
    }
}
