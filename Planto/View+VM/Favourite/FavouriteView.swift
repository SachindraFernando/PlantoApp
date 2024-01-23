//
//  FavouriteView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct  FavouriteView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Theme.primaryColor
            VStack{
                
                CommonHeader(title: "Favourites", leadingIcon: "ic_back", trailingIcon: "", leadingAction: {
                    self.presentationMode.wrappedValue.dismiss()
                }, trailingAction: {})
                .foregroundColor(Theme.whiteColor)
                .padding(.all)
                
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            
                            HStack{
                                Text("Favourite Plants")
                                    .padding(.top, 32)
                                    .foregroundColor(Color.black)
                                    .font(.customFont(.InterMedium, 12))
                                Spacer()
                            }
                            
                            ForEach(dummyPlantList) { plantModel in
                                FavouriteCard(plantModel: plantModel){
                                    
                                }
                            }
                            .padding(.top,10)
                            
                            Spacer()
                            
                            
                        }//:VStack
                        .padding(.horizontal,24)
                        .frame(minHeight: geometry.size.height)
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                }//:GeometryReader
                .background(Theme.whiteColor)
                .clipShape(RoundedShape())
            }//:VStack
            .padding(.top, 35)
        }//:ZStack
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
        //.navigate(to: ProfileView(),when: $goToProfileView)

        
    }
    
}


struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
