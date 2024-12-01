//
//  Article.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation
import Firebase


struct ArticleModel: Identifiable, Codable {
    var id: String
    var title: String
    var content: String
    var userId: String
    var timestamp: Timestamp
    var author: UserModel?
}

let dummyArticle: ArticleModel = ArticleModel(
    id: "id_this",
    title: "Mobile Developers Have Lost Their Glory, And Here's Why",
    content:"""
    I recently saw this research published in indeed.com where the survey among developers showcased the
    shifting landscape of mobile development. The rise of web applications and cross-platform frameworks
    has changed the perception of mobile developers, who now find themselves at a crossroads.

    In this article, I will explore the reasons behind this shift and what it means for aspiring mobile developers.
    """,
    userId: "user_id",
    timestamp: Timestamp(date: .now),
    author: dummyUserModel
)
