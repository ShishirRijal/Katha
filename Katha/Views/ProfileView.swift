//
//  ProfileView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Text("Shishir Rijal")
                .font(.logoFont())
            .fontWeight(.bold)
            
            Image(systemName: "person.fill")
                .font(.title)
                .foregroundColor(.theme.accent)
        }
    }
}

#Preview {
    ProfileView()
}
