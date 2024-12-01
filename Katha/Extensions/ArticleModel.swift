//
//  ArticleModel.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation
import CoreData

extension ArticleModel {
    var isBookmarked: Bool {
        let fetchRequest: NSFetchRequest<BookmarkedArticle> = BookmarkedArticle.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        let count = try? CoreDataManager.shared.context.count(for: fetchRequest)
        return (count ?? 0) > 0
    }
}
