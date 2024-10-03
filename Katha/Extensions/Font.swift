//
//  Font.swift
//  Katha
//
//  Created by Shishir Rijal on 04/10/2024.
//

import SwiftUI

enum CustomFont: String {
    case poppinsBold = "Poppins-Bold"
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
    
    case playfairDisplayBold = "PlayfairDisplay-Bold"
    case playfairDisplayRegular = "PlayfairDisplay-Regular"
    case playfairDisplayMedium = "PlayfairDisplay-Medium"
}


extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
    
    static func logoFont() -> Font {
        return .custom(.playfairDisplayBold, size: 24)
    }
    
    static func bodyFont(size: CGFloat = 16) -> Font {
        return .custom(.poppinsRegular, size: size)
    }
}

