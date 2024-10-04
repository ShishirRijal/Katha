//
//  HomeView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack {
            Text("Home")
                .font(.logoFont())
            .fontWeight(.bold)
            
            Image(systemName: "house.fill")
                .font(.title)
                .foregroundColor(.theme.accent)
        }
    }
}

#Preview {
    HomeView()
}
