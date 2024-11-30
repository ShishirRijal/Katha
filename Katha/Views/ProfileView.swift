//
//  ProfileView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // logout
                        authVM.logout()
                    }, label: {
                        Image(systemName: "gearshape") // rectangle.portrait.and.arrow.right
                            .foregroundColor(.primary)
                            .font(.title2)
                    })
                    .padding(.horizontal)
                }


                ScrollView {
                    VStack(spacing: 20) {
                        // Profile Header
                        HStack {
                            Image(user.profileImageURL)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 8) {
                                Text(user.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text(user.username)
                                    .font(.subheadline)
                                Text(user.bio)
                                    .font(.body)
                                    .lineLimit(3)
                            }
                            Spacer()
                        }
                        
                        // Statistics
                        HStack(spacing: 40) {
                            StatsView(label: "Articles", value: user.articleCount)
                           
                            VerticalDivider()
                            
                            StatsView(label: "Followers", value: user.followerCount)
                            
                            VerticalDivider()
                            
                            StatsView(label: "Following", value: user.followingCount)
                        }
                        
                        Divider()
                            .frame(height: 2)
                            .background(.lightGray)
                            .padding(.top, 20)
                        
                        
                        
                        HStack {
                            Text("Recent Articles")
                                .font(.custom(.poppinsBold, size: 20))
                                .foregroundColor(Color.theme.primary)
                            
                            Spacer()
                        }
                        
                        // Recent Articles
                        VStack(spacing: 16) {
                            ForEach(user.recentArticles) { article in
                                CustomArticleCard(article: article, isBookmark: false)
                                Divider().padding(10)
                            }
                            
                        }

                    }
                    .padding()

                }
            }
        }
        .safeAreaInset(edge: .bottom, alignment: .trailing) {
            Image(systemName: "square.and.pencil")
                .font(.title2)
                .padding()
                .foregroundColor(.theme.white)
                .background(Color.theme.accent)
                .clipShape(Circle())
                .padding(.horizontal)

        }
    }
}

#Preview {
    ProfileView(user: dummyUser)
}



struct StatsView: View {
    let label: String
    let value: Int

    var body: some View {
        VStack(alignment: .center) {
            Text(String(value))
                .font(.headline)
                .fontWeight(.bold)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}


struct VerticalDivider: View {
    var body: some View {
        Divider()
            .frame(width:2)
            .background(.lightGray)
    }
}



