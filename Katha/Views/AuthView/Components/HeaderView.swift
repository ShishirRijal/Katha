//
//  HeaderView.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import SwiftUI

/// Header with a title and subtitle for Auth screens
struct TitleView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack {
            Text(title)
                .font(.logoFont())
            Spacer().frame(height: 20)
            Text(subtitle)
                .font(.custom(.playfairDisplayMedium, size: 30))
                .multilineTextAlignment(.center)
        }
    }
}

// MARK: Preview
#Preview {
    TitleView(title: "Medium", subtitle: "Sign up with email.")
}

