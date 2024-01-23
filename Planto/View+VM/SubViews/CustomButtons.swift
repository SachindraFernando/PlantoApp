//
//  CustomButtons.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

//Btn Style
struct PrimaryBtnStyle: ViewModifier {
    
    var foregroundColor: Color = Color.white
    var colorBackground: Color = Theme.primaryColor
    var minWith:CGFloat = 60
    var maxWidth:CGFloat = .infinity
    var minHeight:CGFloat = 50
    var maxHeight:CGFloat = 55
    var cornerRadius:CGFloat = 30

    func body(content: Content) -> some View {
        content
            .font(.customFont(.InterSemiBold, 16))
            .foregroundColor(foregroundColor)
            .frame(minWidth: minWith, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight, alignment: .center)
            .background(colorBackground)
            .cornerRadius(cornerRadius)
            .shadow(color: Color.black.opacity(0.06), radius: 20, x: 0.0, y: 8.0)
    }
}



struct OutlineBtnStyle: ViewModifier {
    
    var colorBorder: Color = Theme.primaryColor
    var minWith:CGFloat = 60
    var maxWidth:CGFloat = .infinity
    var minHeight:CGFloat = 50
    var maxHeight:CGFloat = 55
    func body(content: Content) -> some View {
        content
            .font(.customFont(.InterSemiBold, 16))
            .foregroundColor(colorBorder)
            .frame(minWidth: minWith, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 38)
                    .stroke(colorBorder, lineWidth: 2)
            )
            .cornerRadius(30)
    }
}

