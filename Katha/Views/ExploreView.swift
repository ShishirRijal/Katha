//
//  ExploreView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        HStack {
            Text("Explore")
                .font(.logoFont())
            .fontWeight(.bold)
            
            Image(systemName: "magnifyingglass")
                .font(.title)
                .foregroundColor(.theme.accent)
        }
    }
}

#Preview {
    ExploreView()
}
