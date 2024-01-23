//
//  QuantityView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct QuantityView: View {
    @State var count: Int = 0
    var rectangleHeight: CGFloat
    var iconSize: CGFloat
    var textSize: CGFloat
    
    var body: some View {
        HStack(spacing: 4) {
            VStack{
                Image(systemName: "minus")
                    .foregroundColor(Theme.primaryColor)
                    .font(.customFont(.InterSemiBold, iconSize))
                    //.resizable()
                    //.frame(width:size, height:size)
            }
                .onTapGesture {
                    if count > 0 {
                        count -= 1
                    }
                }
            Rectangle()
                .frame(width: 1, height: rectangleHeight)
                .foregroundColor(Theme.primaryColor)
            
            Text("\(count)")
                            .font(.customFont(.InterSemiBold, textSize))
                            .foregroundColor(Theme.primaryColor)
                            
            
            Rectangle()
                .frame(width: 1, height: rectangleHeight)
                .foregroundColor(Theme.primaryColor)
                
            
            VStack{
                Image(systemName: "plus")
                    .foregroundColor(Theme.primaryColor)
                    .font(.customFont(.InterSemiBold, iconSize))
                        //.resizable()
                        //.frame(width:size, height:size)
            }
            
                .onTapGesture {
                    count += 1
                }
        }
        .padding(.horizontal,4)
        .background(RoundedRectangle(cornerRadius: 28).fill(Theme.borderColor))
        .overlay(RoundedRectangle(cornerRadius: 28).strokeBorder(Theme.primaryColor, style: StrokeStyle(lineWidth: 1.0)))
    }
}


struct QuantityView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityView(rectangleHeight: 12, iconSize: 8, textSize: 9)
    }
}

