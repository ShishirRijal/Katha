//
//  LoginViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""

    func login() {
        debugPrint("Logging in with email...")
    }
    
}
