//
//  WriteArticleView.swift
//  Katha
//
//  Created by Shishir Rijal on 30/11/2024.
//

import SwiftUI

struct WriteArticleView: View {
    @State private var fullText = ""
    @State var articleText = ""
    @State var title = "New Article"

    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

                TextEditor(text: $fullText)
                    .font(.bodyFont())
                    .onChange(of: fullText) { oldValue, newValue in
                        if newValue.isEmpty {
                            title = "New Article"
                        } else {
                            title = newValue.components(separatedBy: .newlines).first!
                            title = title.trimmingCharacters(in: .whitespaces)
                        }

                        if newValue.contains("\n") {
                            articleText = newValue.components(separatedBy: .newlines).dropFirst().joined(separator: "\n")
                        }

                    }


            }
            .padding()
        }
    }
}




#Preview {
    WriteArticleView()
}
