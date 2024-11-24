//
//  SplashScreen.swift
//  Katha
//
//  Created by Shishir Rijal on 15/11/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var showText = ""
    @State private var navigateToHome = false
    private let fullText = "Katha"
    private let typingSpeed = 0.1

    var body: some View {
      NavigationStack {
        VStack(spacing: 20) {
              Image("Logo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 200, height: 200)

              Text(showText)
              .font(.largeTitle)
              .fontWeight(.medium)
              .foregroundColor(.black)
                  .onAppear(perform: startTypingAnimation)
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color.white)
          .ignoresSafeArea()
                .navigationDestination(isPresented: $navigateToHome) {
                    MainTabView()
                      .navigationBarBackButtonHidden(true)
              }
      }

    }

    // Typewriter animation function
    private func startTypingAnimation() {
        showText = ""
        for (index, letter) in fullText.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * typingSpeed) {
                showText.append(letter)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                  navigateToHome = true
        }
    }
}

#Preview {
  SplashScreenView()
}
