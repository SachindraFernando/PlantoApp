//
//  RecentlyAddedCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct RecentlyAddedCard: View {
    var plant:PlantModel
    var body: some View {
        HStack(alignment: .top) {
            Image(plant.image)
                .resizable()
                .frame(width: 60,height: 60)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading,spacing:5) {
                Text(plant.name)
                    .font(.customFont(.InterSemiBold, 10))
                    .padding(.top, 5)
                Text(plant.price)
                        .font(.customFont(.InterBold, 10))
                        .foregroundColor(Theme.textDarkGraydColor)
                
                QuantityView(rectangleHeight: 12, iconSize: 8, textSize: 9)
                    .padding(.top, 4)
                
            }//:VStack
            
           
            Spacer()
            
            Button("+Add") {}
                .font(.customFont(.InterSemiBold, 12))
                .modifier(PrimaryBtnStyle(maxWidth: 60, minHeight: 10,maxHeight: 25, cornerRadius: 10))
                .padding(.top,10)
         
            
        }//:HStack
        .padding(.all,10)
        .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Theme.borderColor, style: StrokeStyle(lineWidth: 0.5)))
        
    }
}

struct RecentlyAddedCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyAddedCard(plant:dummyPlantModel)
    }
}

