//
//  LibraryView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Header()
                    .padding(.bottom, 20)
                
              ForEach(dummyArticles.count-4..<dummyArticles.count) { index in
                        CustomArticleCard(article: dummyArticles[index], isBookmark: true)
                        Divider()
                        .padding(.vertical, 10)
                }
                
                
                
            }
            .padding(.horizontal)
        }
        .background(Color.theme.background
            .ignoresSafeArea()
            
        )
    }
    
    private struct Header: View {
        var body: some View {
            HStack() {
                Text("Your Library")
                    .font(.custom(.poppinsMedium, size: 30))
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
    }
    
}


#Preview {
    LibraryView()
}
