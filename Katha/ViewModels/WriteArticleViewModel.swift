//
//  WriteArticleViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 30/11/2024.
//

import Foundation
import Combine

class WriteArticleViewModel: ObservableObject {
    @Published var fullText: String = ""
    @Published var articleText: String = ""
    @Published var title: String = "New Article"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isArticleSaved: Bool = false

    // Computed property for error message
    var getErrorMessage: String {
        return errorMessage ?? "An unknown error occurred!"
    }

    var isError: Bool {
        return errorMessage != nil
    }

    func handleTextChange(newValue: String) {
        if newValue.isEmpty {
            title = "New Article"
        } else {
            title = newValue.components(separatedBy: .newlines).first!.trimmingCharacters(in: .whitespaces)
        }

        if newValue.contains("\n") {
            articleText = newValue.components(separatedBy: .newlines).dropFirst().joined(separator: "\n")
        }
    }


    func saveArticle() async {
        errorMessage = nil
        isLoading = true
        do {
            try await DatabaseService.shared.saveArticle(title: title, content: articleText)
            isArticleSaved = true
            print("Article saved successfully!")
        } catch {
            print("Error saving article: \(error)")
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
