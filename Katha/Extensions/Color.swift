//
//  Color.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import Foundation
import SwiftUI


extension Color {
    static let theme = ColorTheme()
}


struct ColorTheme {
    let primary = Color("PrimaryColor")
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let white = Color("WhiteColor")
    let black = Color("BlackColor")
    let gray = Color("GrayColor")
}
