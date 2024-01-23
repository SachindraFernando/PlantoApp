//
//  CommonHeader.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct CommonHeader: View {
    var title:String
    var leadingIcon:String = "ic_selected_home"
    var trailingIcon:String = "ic_selected_home"
    var leadingAction:()->()
    var trailingAction:()->()
    var body: some View {
        HStack{
            Image(leadingIcon)
                .resizable()
                .frame(width: 24,height: 24)
                .onTapGesture{
                    leadingAction()
                }
            Spacer()
            Text(title)
                .font(.customFont(.InterSemiBold, 22))
            Spacer()
            Image(trailingIcon)
                .resizable()
                .frame(width: 24,height: 24)
                .onTapGesture{
                    trailingAction()
                }
        }//:HStack
        .padding(.horizontal,20)
        //.padding(.top,getSafeArea().top)
    }
}
