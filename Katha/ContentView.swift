//
//  ContentView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .imageScale(.large)
                .foregroundStyle(Color.theme.primary)
            Text("Medium").font(Font.custom("Poppins-Regular", size: 32))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
