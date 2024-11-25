//
//  TermsView.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import SwiftUI

/// Terms and privacy agreement text for Registration
struct TermsView: View {
    var body: some View {
        VStack {
            Text("By signing up, you agree to our ")
                + Text("Terms of Service")
                    .underline()
                    .foregroundColor(.blue)
                + Text(" and acknowledge that our ")
                + Text("Privacy Policy")
                    .underline()
                    .foregroundColor(.blue)
                + Text(" applies to you.")
        }
        .multilineTextAlignment(.center)
        .font(.bodyFont(size: 12))
    }
}

// MARK: Preview
#Preview {
    TermsView()
}
