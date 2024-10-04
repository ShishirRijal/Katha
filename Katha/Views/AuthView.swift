//
//  LoginView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isLogin: Bool = false
    
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
                
                CustomLoginCard(name: "Google", icon: .google, isLogin: $isLogin)
                    .padding(.bottom, 5)
                
                CustomLoginCard(name: "Facebook", icon: .facebook, isLogin: $isLogin)
                    .padding(.bottom, 5)
                
                CustomLoginCard(name: "Apple", icon: .apple, isLogin: $isLogin)
                    .padding(.bottom, 5)
                
                CustomLoginCard(name: "Email", icon: .email, isLogin: $isLogin)
                    .padding(.bottom, 5)
                
                Spacer()
                    .frame(height: 30)

                VStack {
                    Text(isLogin ? "Don't have an account? " : "Already have an account? ")
                    + Text(isLogin ? "Sign up." : "Sign in.")
                        .underline()
                        .foregroundColor(.green)
                            
                }
                .multilineTextAlignment(.center)
                .onTapGesture {
                    isLogin.toggle()
                }
                
                Spacer()
                    .frame(height: 50)
                
                if !isLogin {
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
                
                
                
            }
            .padding()
        }
        
    }
}

#Preview {
    AuthView()
}

struct CustomLoginCard: View {
    
    let name: String
    let icon: ImageResource
    @Binding var isLogin: Bool
    
    
    var body: some View {
        HStack(alignment: .center) {
            Image(icon)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 25)
            Spacer()
            Text( isLogin ? "Sign in with \(name)" : "Sign up with \(name)")
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(.primary, lineWidth: 2))
        
        
    }
}
