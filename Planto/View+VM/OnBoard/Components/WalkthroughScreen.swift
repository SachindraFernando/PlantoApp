//
//  WalkthroughScreen.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct WalkthroughScreen: View {
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack{
            if currentPage == 1{
                OnBoardScreen(image: "hanging_plant", title: "Potted plants near you", detail: "PLANTO is an app for purchasing and selling potted plants near you.", bgColor: Theme.primaryColor)
                    .transition(.scale)
            }
            if currentPage == 2{
                OnBoardScreen(image: "moving_plant", title: "Potted plants near you", detail: "PLANTO is an app for purchasing and selling potted plants near you.", bgColor: Theme.primaryColor)
                    .transition(.scale)
            }
            if currentPage == 3{
                OnBoardScreen(image: "cactus", title: "Potted plants near you", detail: "PLANTO is an app for purchasing and selling potted plants near you.", bgColor: Theme.primaryColor)
                    .transition(.scale)
            }
        }//:ZStack
        .overlay(
        Button(action: {
            withAnimation(.easeInOut){
                if currentPage <= totalPages{
                    currentPage += 1
                }else{
                    currentPage = 1
                }
            }
        }, label: {
            Image(systemName: "chevron.right")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            //Circular Slider
                .overlay(
                    ZStack{
                        Circle()
                            .stroke(Color.black.opacity(0.04), lineWidth: 4)
                        Circle()
                            .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                            .stroke(Color.white, lineWidth: 4)
                            .rotationEffect(.init(degrees: -90))
                    }
                        .padding(-15)
                )
        })
        .padding(.bottom, 20)
        
        ,alignment: .bottom
        )
    }
}

struct WalkthroughScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughScreen()
    }
}
