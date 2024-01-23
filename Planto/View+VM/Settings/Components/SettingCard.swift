//
//  SettingCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct SettingCard: View {
    var image:String
    var title:String
    var isShownArrow: Bool
    var body: some View {
        VStack {
            HStack{
                Image(image)
                .padding(.all)
                .foregroundColor(Theme.primaryColor)
                .frame(width: 40, height: 40)
                .foregroundColor(Color.white)
                .background(Theme.borderColor)
                .clipShape(Circle())
                    
               
                    Text(title)
                        .font(.customFont(.InterMedium, 18))
                        .foregroundColor(Theme.textDarkGraydColor)
                
                Spacer()
                
                if isShownArrow{
                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16,height: 16)
                        .foregroundColor(Theme.primaryColor)
                }
            }//:HStack
            .padding()
        }//:VStack
    }
}

struct SettingCard_Previews: PreviewProvider {
    static var previews: some View {
        SettingCard(image:"ic_eye",title: "qqq", isShownArrow: true)
    }
}

