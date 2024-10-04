//
//  RegistrationViewModel.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    
    func register() {
        debugPrint("Signing up with email...")
    }
    
}
