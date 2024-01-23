//
//  PlantDetailView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct PlantDetailView: View {
    var plantDetail:PlantModel
    
    @State  var isActiveMyCartScreen: Bool = false
    @State  var isFavouriteScreen: Bool = false
    
    var body: some View {
        
        ZStack {
            Theme.primaryColor
            VStack{
                //header
                DetailsHeader(title: plantDetail.name,trailingImg: "ic_cart"){
                    
                }
                HStack {
                    Image("description_image")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(35)
                        //.frame(width: 192, height: 192)
                        
                }
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(plantDetail.name)
                                        .font(.customFont(.InterSemiBold, 20))
                                    Text(plantDetail.size)
                                        .font(.customFont(.InterSemiBold, 16))
                                        .foregroundColor(Theme.textDarkGraydColor)
                                    
                                }
                                Spacer()
                                
                                
                                Image("ic_heart")
                                    .foregroundColor(plantDetail.iFavourite ? Theme.primaryColor : Theme.textDarkGraydColor)
                                .padding(.all)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                                .background(Theme.borderColor)
                                .clipShape(Circle())
                                    .onTapGesture{
                                        isFavouriteScreen.toggle()
                                
                                    }
                                
                            }//:HStack
                            
                            
                            HStack{
                                QuantityView(rectangleHeight: 24, iconSize: 14, textSize: 16)
                                Spacer()
                                Text(plantDetail.price)
                                    .font(.customFont(.InterSemiBold, 26))
                            }//:HStack
                            .padding(.top,20)
                            
                            
                            HStack {
                                Text("Description")
                                    .font(.customFont(.InterSemiBold, 16))
                                Spacer()
                                
                            }//:HStack
                            .padding(.top,20)
                            
                            ExpandableText("design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.", lineLimit: 40)
                            
                            Spacer()
                            
                            HStack{
                                
                                Button("Add to Cart") {
                                    isActiveMyCartScreen.toggle()
                                }
                                .modifier(PrimaryBtnStyle(maxWidth: .infinity,minHeight: 56))
                                
                            }//:HStack
                            .padding(.bottom)
                        }//:VStack
                        .padding(.top)
                        .padding(.horizontal,24)
                        .frame(minHeight: geometry.size.height)
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                }//:GeometryReader
                
                .background(Theme.whiteColor)
                .clipShape(RoundedShape())
                .padding(.top, -50)
            }//:VStack
            .padding(.top, 40)
        }//:ZStack
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
        .navigate(to: MyCartView(),when: $isActiveMyCartScreen)
        
    }
    }


struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plantDetail: dummyPlantModel)
        
        
    }
}
