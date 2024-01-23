//
//  SettingsView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct  SettingsView: View {
    
    @State  var goToProfileView: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Theme.primaryColor
            VStack{
                
                CommonHeader(title: "Settings", leadingIcon: "ic_back", trailingIcon: "", leadingAction: {
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
                            
                            ContactsCard(personModel: dummyPersonModel) {
                                goToProfileView.toggle()
                            }
                            .padding(.leading)
                            
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .padding(.horizontal)
                                .frame(width: geometry.size.width, height: 0.2)
                                .padding(.top)
                            
                            
                            VStack(alignment: .leading){
                                Text("General")
                                    .font(.customFont(.InterMedium, 14))
                                    .foregroundColor(Theme.textDarkGraydColor)
                                    .padding(.leading)
                                    
                                SettingCard(image: "ic_language", title: "Language",isShownArrow: true)
                                SettingCard(image: "ic_visibility", title: "Dark Mode",isShownArrow: false)
                            }
                            
                            VStack(alignment: .leading){
                                Text("Purchase")
                                    .font(.customFont(.InterMedium, 14))
                                    .foregroundColor(Theme.textDarkGraydColor)
                                    .padding(.leading)
                                    
                                SettingCard(image: "ic_purchase", title: "My Cart",isShownArrow: true)
                                SettingCard(image: "ic_heart", title: "Favourites",isShownArrow: true)
                            }
                            VStack(alignment: .leading){
                                Text("About")
                                    .font(.customFont(.InterMedium, 14))
                                    .foregroundColor(Theme.textDarkGraydColor)
                                    .padding(.leading)
                                    
                                SettingCard(image: "ic_help", title: "Help Center",isShownArrow: true)
                                SettingCard(image: "ic_privacy", title: "Privacy Policy",isShownArrow: true)
                                SettingCard(image: "ic_info", title: "About Planto App",isShownArrow: true)
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
        .navigate(to: ProfileView(),when: $goToProfileView)

        
    }
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
