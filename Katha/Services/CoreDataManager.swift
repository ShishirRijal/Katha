//
//  CoreDataManager.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation
import CoreData
import Firebase

class CoreDataManager {
    static let shared = CoreDataManager()
    private let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Katha")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving CoreData: \(error.localizedDescription)")
        }
    }

    func saveArticle(_ article: ArticleModel) {
        let bookmark = BookmarkedArticle(context: context)
        bookmark.id = article.id
        bookmark.title = article.title
        bookmark.content = article.content
        bookmark.authorName = article.author?.fullName ?? "Unknown"
        bookmark.timestamp = article.timestamp.dateValue()
        bookmark.userId = article.userId

        saveContext()
    }

    func deleteArticle(withId id: String) {
        let fetchRequest: NSFetchRequest<BookmarkedArticle> = BookmarkedArticle.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)

        do {
            let articles = try context.fetch(fetchRequest)
            for article in articles {
                context.delete(article)
            }
            saveContext()
        } catch {
            print("Error deleting article: \(error.localizedDescription)")
        }
    }

    func fetchAllBookmarkedArticles() -> [ArticleModel] {
        let fetchRequest: NSFetchRequest<BookmarkedArticle> = BookmarkedArticle.fetchRequest()

        do {
            let bookmarkedArticles = try context.fetch(fetchRequest)
            return bookmarkedArticles.map { bookmark in
                ArticleModel(
                    id: bookmark.id ?? "",
                    title: bookmark.title ?? "",
                    content: bookmark.content ?? "",
                    userId: bookmark.userId ?? "",
                    timestamp: Timestamp(date: bookmark.timestamp ?? Date()),
                    author: UserModel(
                        id: bookmark.userId ?? "",
                        email: "",
                        fullName: bookmark.authorName ?? "",
                        photoURL: "",
                        bio: "",
                        followers: 0
                    )
                )
            }
        } catch {
            print("Error fetching bookmarked articles: \(error.localizedDescription)")
            return []
        }
    }
}
