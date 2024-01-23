//
//  Theme.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

class Theme {
    static let primaryColor = Color("#2C5E46")
    static let whiteColor = Color.white
    static let textDarkGraydColor = Color.gray
    static let borderColor = Color("#E8F3F1")
    static let blackColor = Color.black
    static let redColor = Color("#b01c1c")
    
    static let secondaryColor = Color("#F5F7FF")
    static let backgroundColor = Color.white
    static let defaultBackgroundColor = Color("#e5e5e5")
    static let grayCardColor = Color("#F5F7FF")
    static let textGrayColor = Color("#A1A8B0")
    static let textLightGraydColor = Color("#565656")
    static let errorColor = Color("#FF5C5C")
    static let deActiveColor = Color("#DEECE9")
    static let audiooBtnGray = Color("#C4C4C4")
    
    static let grayColor = Color("#555555")
    static let greenColor = Color("#7BEB78")
    static let lightGreenColor = Color("#C1F3EF")
    static let chatTextGrayColor = Color("#ADADAD")

    private init() {}
}

extension View {
    func themedBackground() -> some View {
        self.background(Theme.backgroundColor)
    }
    
    func themedForegroundColor() -> some View {
        self.foregroundColor(Theme.primaryColor)
    }
}
