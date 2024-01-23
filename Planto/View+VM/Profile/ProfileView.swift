//
//  ProfileView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct  ProfileView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Theme.primaryColor
            VStack{
                
                CommonHeader(title: "Profile", leadingIcon: "ic_back", trailingIcon: "", leadingAction: {
                    self.presentationMode.wrappedValue.dismiss()
                }, trailingAction: {})
                .foregroundColor(Theme.whiteColor)
                .padding(.all)
                
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .frame(width: 25, height: 1)
                                .padding(.top)
                            
                            VStack{
                                Image("profile_image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                Text("Weni Fdo")
                                    .font(.customFont(.InterMedium, 14))
                                    .foregroundColor(Theme.textDarkGraydColor)
                                
                            }
                            
                            
                            
                            VStack(alignment: .leading){
                                Text("About")
                                    .font(.customFont(.InterMedium, 14))
                                    .foregroundColor(Theme.textDarkGraydColor)
                                    .padding(.leading)
                                    
                                SettingCard(image: "ic_location", title: "London, UK",isShownArrow: false)
                                SettingCard(image: "ic_phone", title: "+44098765432",isShownArrow: false)
                               
                            }
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


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
