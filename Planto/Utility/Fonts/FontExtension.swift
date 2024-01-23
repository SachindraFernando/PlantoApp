//
//  FontExtension.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI


enum MedicsAppFonts: String {
    case InterMedium = "Inter-Medium"
    case InterRegular = "Inter-Regular"
    case InterSemiBold = "Inter-SemiBold"
    case InterBlack = "Inter-Black.ttf"
    case InterBold = "Inter-Bold"
    case AclonicaRegular = "Aclonica-Regular"
}

extension Font {
    static func customFont( _ name: MedicsAppFonts, _ size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}

