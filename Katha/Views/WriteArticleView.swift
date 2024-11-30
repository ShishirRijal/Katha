//
//  WriteArticleView.swift
//  Katha
//
//  Created by Shishir Rijal on 30/11/2024.
//

import SwiftUI

struct WriteArticleView: View {
    @StateObject var vm = WriteArticleViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var showToast = false

    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottom) {
                VStack {
                    Text(vm.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                    TextEditor(text: $vm.fullText)
                        .font(.bodyFont())
                        .onChange(of: vm.fullText) { oldValue, newValue in
                            vm.handleTextChange(newValue: newValue)
                        }
                    CustomButton(title: "Publish", isDisabled: vm.articleText.isEmpty, isLoading: vm.isLoading) {
                        Task {
                            await vm.saveArticle()
                            if(vm.isArticleSaved) {
                                withAnimation {
                                    showToast = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                }
                .alert(isPresented: .constant(vm.isError), content: {
                    Alert(
                        title: Text("Coulnd't save article!"),
                        message: Text(vm.getErrorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                })
                .padding()
                
                // Toast
                if showToast {
                    ToastView(message: "Article Saved Successfully!")
                        .transition(.opacity)
                        .zIndex(1) // Ensure it appears on top
                        .padding(.bottom, 80)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    showToast = false
                                }
                            }
                        }
                    }
            }
        }
    }
}




#Preview {
    WriteArticleView()
}




struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(8)
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
    }
}
