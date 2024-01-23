//
//  BestPlantCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct BestPlantCard: View {
    var plantModel:PlantModel
    @State  var isActivePlantScreen: Bool = false
    @State var  selectedPlant:PlantModel = dummyPlantModel
    
    var body: some View {
        
        ZStack{
        VStack {
            Image(plantModel.image)
                .resizable()
                .frame(width: 120,height: 120)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .center,spacing: 3) {
                Text(plantModel.name)
                    .font(.customFont(.InterSemiBold, 14))
                
                Text(plantModel.price)
                    .foregroundColor(Theme.textDarkGraydColor)
                    .font(.customFont(.InterBold, 12))
                
                Button("Buy Now") {
                    isActivePlantScreen.toggle()
                }
                .font(.customFont(.InterSemiBold, 12))
                .modifier(PrimaryBtnStyle(maxWidth: 80, minHeight: 20,maxHeight: 35, cornerRadius: 12))
                .padding(.top,10)
                
            }//:VStack
            
        }//:VStack
        .padding()
        .background(RoundedRectangle(cornerRadius: 18).fill(Theme.borderColor))
        .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Theme.borderColor, style: StrokeStyle(lineWidth: 0.5)))
    }
        .navigate(to: PlantDetailView(plantDetail: selectedPlant),when: $isActivePlantScreen)
    }
}

struct BestPlantCard_Previews: PreviewProvider {
    static var previews: some View {
        BestPlantCard(plantModel: dummyPlantModel)
    }
}

