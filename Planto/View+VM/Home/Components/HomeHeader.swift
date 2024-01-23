//
//  HomeHeader.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct HomeHeader: View {
    var title:String
    var trailingIcon:String
    var action:()->()
    var body: some View {
        HStack{
            
            Text(title)
                .font(.customFont(.InterSemiBold, 22))
            Spacer()
            
            
            Image(trailingIcon)
                .resizable()
                .frame(width: 24,height: 24)
                .onTapGesture{
                    action()
                }
            
        }//:HStack
        .padding(.horizontal,24)
        .padding(.top,getSafeArea().top)
    }
}

struct HomeHeaderTwo: View {
    var title:String
    var leadingIcon:String
    var trailingIcon:String
    var actionLeading:()->()
    var actionTrailing:()->()
    var body: some View {
        HStack{
            Image(leadingIcon)
                .resizable()
                .frame(width: 24,height: 24)
                .onTapGesture{
                    actionLeading()
                }
            Spacer()
            Text(title)
                .font(.customFont(.InterSemiBold, 22))
            Spacer()
            Image(trailingIcon)
                .resizable()
                .frame(width: 24,height: 24)
                .onTapGesture{
                    actionTrailing()
                }
            
        }//:HStack
        .padding(.horizontal,24)
        .padding(.top,getSafeArea().top)
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader(title: "Find your desire \nhealt solution",trailingIcon: "ic_search"){
            
        }
            .previewLayout(.sizeThatFits)
    }
}

