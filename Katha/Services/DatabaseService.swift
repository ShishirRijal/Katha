//
//  DatabaseService.swift
//  Katha
//
//  Created by Shishir Rijal on 30/11/2024.
//
import Foundation
import Firebase
import FirebaseAuth

class DatabaseService {
    static let shared = DatabaseService()
    private let db = Firestore.firestore()

    // Function to save the article to Firebase
    
    func saveArticle(title: String, content: String) async throws {

        // Fetch the user ID
        guard let userId = Auth.auth().currentUser?.uid else {
            print("Error fetching user ID")
            throw AuthError.requiresRecentLogin
        }

        // Create the document first to get its ID
        let docRef = db.collection("articles").document()
        let articleId = docRef.documentID

        let articleData: [String: Any] = [
            "id": articleId, // Save the document ID as a field
            "title": title,
            "content": content,
            "userId": userId,
            "timestamp": Timestamp()
        ]

        try await docRef.setData(articleData)
    }

    func fetchAllArticles() async throws -> [ArticleModel] {
        let snapshot = try await db.collection("articles")
            .getDocuments()
        let articles = snapshot.documents.compactMap { doc in
            try? doc.data(as: ArticleModel.self)
        }
        return articles
    }

}
