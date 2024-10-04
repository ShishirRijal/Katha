//
//  HomeView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                // header
                Header()
                // Articles
                ScrollView {
                    ForEach(0..<8) { index in
                        // Article Card
                        VStack {
                            CustomArticleCard()
                            Divider()
                                .overlay(Color.theme.gray)
                                .padding(.vertical, 10)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 5)
        .background(Color.theme.background
            .ignoresSafeArea()
        )
    }
    
    
    private struct Header: View {
        var body: some View {
            HStack() {
                Text("Home")
                    .font(.custom(.poppinsMedium, size: 30))
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "bell")
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
    }

    
}

#Preview {
    HomeView()
}






