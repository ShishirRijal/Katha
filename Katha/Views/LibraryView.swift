//
//  LibraryView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        HStack {
            Text("Your Library")
                .font(.logoFont())
            .fontWeight(.bold)
            
            Image(systemName: "bookmark.fill")
                .font(.title)
                .foregroundColor(.theme.accent)
        }
    }
}


#Preview {
    LibraryView()
}
