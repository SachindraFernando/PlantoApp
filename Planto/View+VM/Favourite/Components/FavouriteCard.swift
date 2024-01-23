//
//  FavouriteCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct FavouriteCard: View {
    var plantModel: PlantModel
    @State  var isActivePlantScreen: Bool = false
    @State var  selectedPlant:PlantModel = dummyPlantModel
    var action: (() -> ())
    var body: some View {
        ZStack{
            HStack {
                Image(plantModel.image)
                    .resizable()
                    .frame(width: 50,height:
                            50)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
                VStack(alignment: .leading,spacing: 8){
                    
                    HStack {
                        VStack(spacing: 6){
                            Text(plantModel.name)
                                .font(.customFont(.InterMedium, 14))
                            HStack{
                                Text(plantModel.price)
                                Text(plantModel.size)
                                    .font(.customFont(.InterMedium, 12))
                                    .foregroundColor(Theme.textDarkGraydColor)
                            }
                        }
                        
                        Spacer()
                        
                        
                            Button("Buy Now") {
                                isActivePlantScreen.toggle()
                            }
                            .font(.customFont(.InterSemiBold, 10))
                            .modifier(PrimaryBtnStyle(maxWidth: 70, minHeight: 10,maxHeight: 25, cornerRadius: 12))
                            .padding(.top,10)
                        
                        
                    }//:HStack
                    
                }
            }//;HStack
            .onTapGesture{
                action()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 18).fill(Theme.borderColor))
            .overlay(RoundedRectangle(cornerRadius: 18).strokeBorder(Theme.borderColor, style: StrokeStyle(lineWidth: 1.0)))
        }
        .navigate(to: PlantDetailView(plantDetail: selectedPlant),when: $isActivePlantScreen)
    }
}

struct FavouriteCard_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteCard(plantModel: dummyPlantModel){}
    }
}

