//
//  AuthViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation


class AuthViewModel: ObservableObject {
    @Published var isLoginMode: Bool = false
    
    func toggleLoginState() {
        isLoginMode.toggle()
    }
}
