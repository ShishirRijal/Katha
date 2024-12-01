//
//  BackButton.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundColor(.theme.primary)
            })
            Spacer() // Spacer to push the button to the left
        }
    }
}

#Preview {
    BackButton()
}
