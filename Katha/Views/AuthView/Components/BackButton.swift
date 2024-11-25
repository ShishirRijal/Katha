//
//  BackButton.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import SwiftUI

struct BackButton: View {
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

#Preview {
    BackButton()
}
