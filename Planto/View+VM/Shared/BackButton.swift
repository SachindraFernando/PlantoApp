//
//  BackButton.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct BackButton: View {
    var action:()->()
    var color: Color
    var body: some View {
        Button {
            action()
        } label: {
            Image("ic_back")
                .foregroundColor(color)
                .frame(width: 24,height: 24)
                .padding(16)
                .frame(width: 40,height: 40)
        }

    }
}

//struct BackButton_Previews: PreviewProvider {
//    static var previews: some View {
//        BackButton(action: {})
//            .previewLayout(.sizeThatFits)
//    }
//}

