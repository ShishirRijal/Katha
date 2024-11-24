//
//  AuthErrorHandler.swift
//  Katha
//
//  Created by Shishir Rijal on 25/11/2024.
//

import Foundation

import FirebaseAuth

enum AuthError: Error {
    case invalidEmail
    case wrongPassword
    case userNotFound
    case emailAlreadyInUse
    case weakPassword
    case networkError
    case tooManyRequests
    case userDisabled
    case requiresRecentLogin
    case invalidCredential
    case unknown

    static func map(_ error: NSError) -> AuthError {
        switch error.code {
        case AuthErrorCode.invalidEmail.rawValue:
            return .invalidEmail
        case AuthErrorCode.wrongPassword.rawValue:
            return .wrongPassword
        case AuthErrorCode.userNotFound.rawValue:
            return .userNotFound
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            return .emailAlreadyInUse
        case AuthErrorCode.weakPassword.rawValue:
            return .weakPassword
        case AuthErrorCode.networkError.rawValue:
            return .networkError
        case AuthErrorCode.tooManyRequests.rawValue:
            return .tooManyRequests
        case AuthErrorCode.userDisabled.rawValue:
            return .userDisabled
        case AuthErrorCode.requiresRecentLogin.rawValue:
            return .requiresRecentLogin
        case AuthErrorCode.invalidCredential.rawValue:
          return .invalidCredential
        default:
            return .unknown
        }
    }

    var description: String {
        switch self {
        case .invalidEmail:
            return "The email address is invalid. Please check and try again."
        case .wrongPassword:
            return "Incorrect password. Please try again."
        case .userNotFound:
            return "No account found for this email. Please sign up."
        case .emailAlreadyInUse:
            return "This email is already in use. Please use a different email."
        case .weakPassword:
            return "The password is too weak. Please use a stronger password (minimum 6 characters)."
        case .networkError:
            return "Network error. Please check your connection and try again."
        case .tooManyRequests:
            return "Too many attempts. Please wait and try again later."
        case .userDisabled:
            return "This account has been disabled. Please contact support."
        case .requiresRecentLogin:
            return "You need to log in again to complete this action."
        case .invalidCredential:
            return "Either email or password incorrect."
        case .unknown:
            return "An unknown error occurred. Please try again later."
        }
    }
}
