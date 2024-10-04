//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 30)
                
                Text("Medium")
                    .font(.logoFont())
                
                Spacer()
                    .frame(height: 30)
                
                Text("Human\nstories and\nideas.")
                    .scaledToFit()
                    .font(.custom(.playfairDisplayMedium, size: 60))
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 30)
                
                Text("Discover perspectives that deepen understanding.")
                    .font(.bodyFont())
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 30)
                
                CustomLoginCard(name: "Google", icon: .google)
                    .padding(.bottom, 5)
                
                CustomLoginCard(name: "Facebook", icon: .facebook)
                    .padding(.bottom, 5)
                
                CustomLoginCard(name: "Apple", icon: .apple)
                    .padding(.bottom, 5)
                
                Spacer()
                    .frame(height: 30)

                VStack {
                    Text("Already have an account? ")
                        + Text("Sign in.")
                            .foregroundColor(.accentColor)
                }
                .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 50)
                
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
                
                
            }
            .padding()
        }
        
    }
}

#Preview {
    RegistrationView()
}

struct CustomLoginCard: View {
    
    let name: String
    let icon: ImageResource
    
    
    var body: some View {
        HStack(alignment: .center) {
            Image(icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 25)
            Spacer()
            Text("Sign up with \(name)")
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(.primary, lineWidth: 2))
        
        
    }
}
