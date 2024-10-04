//
//  CustomLoginCard.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct CustomLoginCard: View {
    
    let name: String
    let icon: ImageResource
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        HStack(alignment: .center) {
                Image(icon)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 25)
                Spacer()
                Text(viewModel.isLoginMode ? "Sign in with \(name)" : "Sign up with \(name)")
                    .font(.bodyFont())
                    .foregroundColor(.theme.primary)
                    
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.theme.primary, lineWidth: 2))
        }
}

#Preview {
    Group {
        CustomLoginCard(name: "Facebook", icon: .facebook)
            .environmentObject(AuthViewModel())
        CustomLoginCard(name: "Google", icon: .google)
            .environmentObject(AuthViewModel())
    }
}

