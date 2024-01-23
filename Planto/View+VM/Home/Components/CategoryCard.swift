//
//  PlantCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct CategoryCard: View {
    var title:String
    var index: Int
    var isClicked: Bool
    var textColor: Color
    var bgColor: Color
    var action: (() -> ())
    
    var body: some View {
        VStack {
            
            VStack{
                Text(title)
                    .font(.customFont(.InterRegular, 14))
                    .foregroundColor(isClicked ? bgColor:textColor)
            }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(isClicked ? textColor:bgColor)
                              .shadow(
                                  color: Color.gray.opacity(0.1),
                                  radius: 15,
                                  x: 0,
                                  y: 0
                               )
                              
                )
            
                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Theme.primaryColor, style: StrokeStyle(lineWidth: 0.5)))
            
        }//:VStack
        .onTapGesture{
            action()
            
        }
    }
}

struct PlantCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Theme.defaultBackgroundColor
           // Color.red
            CategoryCard(title: "Doctor", index: 1, isClicked: false,textColor: Theme.primaryColor, bgColor: Theme.borderColor){}
        }
    }
}

