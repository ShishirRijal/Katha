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
    let isDisabled: Bool
    let isLoading: Bool

  init(title: String, isDisabled: Bool = false, isLoading: Bool = false,  action: @escaping () -> Void) {
    self.title = title
    self.action = action
    self.isDisabled = isDisabled
    self.isLoading = isLoading
  }

    var body: some View {
        Button(action: action) {
          if(isLoading) {
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: .white))
          }
          else {
            Text(title)
              .font(.custom(.poppinsMedium, size: 16))
          }
        }
        .foregroundColor(foregroundColor)
        .padding()
        .frame(maxWidth: .infinity)
        .background(isDisabled ? Color.gray : backgroundColor)
        .cornerRadius(40)
        .shadow(radius: isDisabled ? 0 : 5)
        .disabled(isDisabled)
    }
}

#Preview {
    CustomButton(title: "Register Now", isLoading: false) {
        //
    }
}
