//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Medium")
                .font(.logoFont())
            
            Spacer()
            
            Text("Human\nstories and\nideas.")
                .scaledToFit()
                .font(.custom(.playfairDisplayMedium, size: 60))
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 20)
            
            Text("Discover perspectives that deepen understanding.")
                .font(.bodyFont())
                .multilineTextAlignment(.center)
            
            Spacer()
            
            CustomLoginCard(name: "Google", icon: .google)
                .padding(.bottom, 5)
            
            CustomLoginCard(name: "Facebook", icon: .facebook)
                .padding(.bottom, 5)
            
            CustomLoginCard(name: "Apple", icon: .apple)
                .padding(.bottom, 5)
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                
                Text("Sign in.")
                    .foregroundStyle(.accent)
                    .onTapGesture {
                        print("Login screen...")
                    }
            }
            
        }
        .padding()
        
    }
}

#Preview {
    LoginView()
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
