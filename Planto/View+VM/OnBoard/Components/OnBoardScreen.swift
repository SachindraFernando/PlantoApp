//
//  OnBoardScreen.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct OnBoardScreen: View {
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                if currentPage == 1{
                    Text("Planto")
                        .font(.customFont(.AclonicaRegular, 38))
                        .foregroundColor(Theme.whiteColor)
                        .kerning(1.4)
                        .padding()
                }else{
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .font(.customFont(.InterRegular, 14))
                        .foregroundColor(Theme.whiteColor)
                        .kerning(1.2)
                })
            }//:HStack
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
//            Image(image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            LottieView(filename: image)
                .frame(width: 400, height: 345)
                .clipShape(Circle())
                .shadow(color: .green, radius: 1, x: 0, y: 0)
            
            Text(title)
                .font(.customFont(.InterSemiBold, 20))
                .foregroundColor(Theme.whiteColor)
                .padding(.top)
            
            Text(detail)
                .font(.customFont(.InterRegular, 14))
                .foregroundColor(Theme.whiteColor)
                .kerning(1.3)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }//:VStack
        .background(bgColor.cornerRadius(10).ignoresSafeArea())
        
    }
}
struct OnBoardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardScreen(image: "cactus", title: "ggg", detail: "hcfc gvtc", bgColor: Theme.primaryColor)
    }
}
