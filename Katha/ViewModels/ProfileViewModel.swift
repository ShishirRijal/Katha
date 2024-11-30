//
//  ProfileViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 01/12/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var recentArticles: [ArticleModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let authService = AuthService()

    @MainActor
    func fetchUserProfile() async {
        isLoading = true
        do {
            guard let userId = authService.getUserId() else {
                throw AuthError.requiresRecentLogin
            }
            print("userid: \(userId)")
            let userProfile = try await DatabaseService.shared.fetchUserProfile(id: userId)
            self.user = userProfile
            print("user: \(user?.email ?? "Uknown")")

            // Fetch recent articles
            let articles = try await DatabaseService.shared.fetchRecentArticles(userId: userId)

            self.recentArticles = articles
            print("recent articles: \(recentArticles.count)")
        } catch {
            print("Error fetching user profile: \(error)")
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
