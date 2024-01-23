//
//  CartCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct CartCard: View {
    var plant:PlantModel
    var body: some View {
        HStack {
            Image(plant.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.horizontal,25)
            Spacer()
            VStack {
                
      
                    VStack(alignment: .leading) {
                        HStack {
                            Text(plant.name)
                                .font(.customFont(.InterSemiBold, 20))
                            
                            Spacer()
                            Image("ic_delete")
                                .foregroundColor(Theme.textDarkGraydColor)
                        }//:HStack
                        Text(plant.size)
                            .font(.customFont(.InterSemiBold, 16))
                            .foregroundColor(Theme.textDarkGraydColor)
                        
                    }//:VStack
                  
                    
        
                
                
                   HStack {
                       QuantityView(rectangleHeight: 20, iconSize: 12, textSize: 14)
                       Spacer()
                       
                       Text(plant.price)
                           .font(.customFont(.InterSemiBold, 20))
                   }//:HStack
            }//:VStack
            .padding(.horizontal,16)
             
                
             
                
        
            Spacer()
           
          
            
           
            
        }//:HStack
        .padding(.vertical,10)
        .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Theme.borderColor, style: StrokeStyle(lineWidth: 1.0)))
        .frame(height:121)
    }
}



struct CartCard_Previews: PreviewProvider {
    static var previews: some View {
        CartCard(plant: dummyPlantModel)
    }
}
