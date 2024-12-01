//
//  ProfileView.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var viewModel = ProfileViewModel()
    @State var showLogoutConfirmation = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showLogoutConfirmation = true
                    }, label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward") // rectangle.portrait.and.arrow.right
                            .foregroundColor(.primary)
                            .font(.title2)
                    })
                    .padding(.horizontal)
                }


                ScrollView {
                    VStack(spacing: 20) {
                        // Profile Header
                        if let user = viewModel.user {
                            HStack {
                                AsyncImage(url: URL(string: user.photoURL), content: { Image in
                                    Image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                }, placeholder: {
                                    Image(systemName: "person.fill")
                                })

                                VStack(alignment: .leading, spacing: 8) {
                                    Text(user.fullName)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text(user.email)
                                        .font(.subheadline)
                                    Text(user.bio)
                                        .font(.body)
                                        .lineLimit(3)
                                }
                                Spacer()
                            }

                            // Statistics
                            HStack(spacing: 40) {
                                StatsView(label: "Articles", value: (Int.random(in: 2...45)))

                                VerticalDivider()

                                StatsView(label: "Followers", value: user.followers)

                                VerticalDivider()

                                StatsView(label: "Following", value: Int.random(in: 500...2300))
                            }

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

                       //  Recent Articles
                        
                        if viewModel.isLoading {
                            ProgressView("Loading recent articles...")
                        } else if viewModel.recentArticles.isEmpty {
                            Text("You don't have any articles yet.\nStart writing what's on your mind!")
                                .foregroundColor(.gray)
                                .font(.bodyFont())
                        } else {
                            ForEach(viewModel.recentArticles) {article in
                                NavigationLink(destination: ArticleDetailView(article: article)) {
                                    CustomArticleCard(article: article, isBookmark: false)
                                    Divider().padding(10)

                                }
                                .foregroundColor(.theme.primary)
                            }
                        }
                    }
                    .padding()

                }
            }
            .refreshable {
                await viewModel.fetchUserProfile(forceReload: true)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchUserProfile()
            }
        }
        .safeAreaInset(edge: .bottom, alignment: .trailing) {
            NavigationLink(destination: WriteArticleView()) {
                Image(systemName: "square.and.pencil")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.theme.white)
                    .background(Color.theme.accent)
                    .clipShape(Circle())
                    .padding()
            }

        }
        .alert(isPresented: $showLogoutConfirmation) {
            Alert(title: Text("Sign Out?"), message: Text("Are you sure you want to sign out your account?"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .destructive(Text("Sign Out"), action: {
                // logout
                authVM.logout()
            }))
        }
    }
}

#Preview {
    ProfileView()
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



