//
//  SearchBar.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct SearchBar: View {
    var image: String
    var hint: String
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            
            Image(image)
                .resizable()
                .frame(width: 18,height: 18)
                .foregroundColor(Color.gray)
            
            
            TextField("", text: $text)
                .font(.customFont(.InterRegular, 16))
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .placeholder(when: text.isEmpty) {
                    Text(hint)
                        .foregroundColor(Color.gray)
                        .font(.customFont(.InterRegular, 12))
                }
             
              
        }//:HStack
        .padding()
        .background(RoundedRectangle(cornerRadius: 24).fill(Theme.whiteColor))
        .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(Theme.borderColor, style: StrokeStyle(lineWidth: 1.0)))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(image:"ic_search",hint: "Search doctor, drugs, articles...", text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}

