//
//  SlideMenuView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-13.
//

import SwiftUI

struct SlideMenuView: View {
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width - 90
    @Binding var menuxAxis: CGFloat
    @State var presentLogoutAlert = false
    @State var navigationLinkSelection: Int? = nil

    var body: some View {
        ZStack{
            NavigationLink(destination: LoginView().navigationBarHidden(true).navigationBarTitle(""), tag: 1, selection: $navigationLinkSelection) {
                EmptyView()
            }
            HStack(spacing: 0){
                VStack(alignment: .leading){
                    SlideMenuContentView(menuxAxis: $menuxAxis, presentLogoutAlert: $presentLogoutAlert)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, edges?.top == 0 ? 15 : edges?.top)
                .padding(.bottom, edges?.bottom == 0 ? 15 : edges?.bottom)
                .frame(width: UIScreen.main.bounds.width - 90)
                .background(Color.white)
                .ignoresSafeArea(.all, edges: .vertical)
                Spacer()
            }
            .shadow(color: Color.black.opacity(menuxAxis != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
            .offset(x: menuxAxis)
            .background(Color.black.opacity(menuxAxis == 0 ? 0.5 : 0).ignoresSafeArea(.all, edges: .vertical))
            .onTapGesture {
                withAnimation{
                    menuxAxis = -width
                }
            }
            if presentLogoutAlert{
                CustomAlertView(presentAlert: $presentLogoutAlert, message: "Are you sure you want to log out?", cancelTitle: "Cancel", confirmTitle: "Log out", onTapOnConfirm: {
                    ViewRouter.shared.currentRoot = .home
                })
            }
        }
    }
}

struct SlideMenuContentView: View {
    
    @Binding var menuxAxis: CGFloat
    @Binding var presentLogoutAlert: Bool
    @State var width = UIScreen.main.bounds.width - 90

    var body: some View {
        VStack(alignment: .leading){
            CloseButtonView(onTap: {
                withAnimation{
                    menuxAxis = -width
                }
            }, size: 25)
                .padding(.top, 5)
            appLogoView
            menuView
            //clientInfoView
        }
    }
    
    var appLogoView: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 90)
            .frame(maxWidth: .infinity)
            .padding(.top, 5)
            .foregroundColor(Theme.primaryColor)
    }
    
    var menuView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(1...4, id: \.self) { value in
                    if value == 1{
                        NavigationLink(destination: ProfileView().navigationBarHidden(true).navigationBarTitle("")) {
                            SlideMenuModuleView(title: "Profile", icon: "ic_profile")
                        }.simultaneousGesture(TapGesture().onEnded{
                            withAnimation{
                                menuxAxis = -width
                            }
                        })
                    }else if value == 2{
                        NavigationLink(destination: FavouriteView().navigationBarHidden(true).navigationBarTitle("")) {
                            SlideMenuModuleView(title: "Favourite", icon: "ic_heart")
                        }.simultaneousGesture(TapGesture().onEnded{
                            withAnimation{
                                menuxAxis = -width
                            }
                        })
                    }
                    else if value == 3{
                        NavigationLink(destination: MyCartView().navigationBarHidden(true).navigationBarTitle("")) {
                            SlideMenuModuleView(title: "My Cart", icon: "ic_cart")
                        }.simultaneousGesture(TapGesture().onEnded{
                            withAnimation{
                                menuxAxis = -width
                            }
                        })
                    }else{
                        NavigationLink(destination: SettingsView().navigationBarHidden(true).navigationBarTitle("")) {
                            SlideMenuModuleView(title: "Settings", icon: "ic_settings")
                        }.simultaneousGesture(TapGesture().onEnded{
                            withAnimation{
                                menuxAxis = -width
                            }
                        })
                    }
                }
            }
            Button {
                withAnimation{
                    presentLogoutAlert = true
                }
            } label: {
                HStack{
                    VStack{
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Theme.whiteColor)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 18).fill(Theme.primaryColor))
                    .overlay(RoundedRectangle(cornerRadius: 18).strokeBorder(Theme.primaryColor, style: StrokeStyle(lineWidth: 1.0)))
                    
                    Text("Log Out")
                        .foregroundColor(Theme.primaryColor)
                        .font(.customFont(.InterRegular, 15))
                        .padding(.leading, 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 60)
            }

        }
        .padding(.top, 35)
    }
    
    var clientInfoView: some View {
        VStack(spacing: 0){
            HStack{
                Image("profile_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Theme.textDarkGraydColor.opacity(0.8), style: StrokeStyle(lineWidth: 3))
                            .padding(-4)
                    )
                VStack(alignment: .leading, spacing: 0){
                    Text("Weni Fdo")
                        .font(.customFont(.InterBold, 16))
                    Text("weni@gmail.com")
                        .font(.customFont(.InterRegular, 14))
                        .foregroundColor(Theme.textDarkGraydColor)
                }
                .foregroundColor(Theme.textDarkGraydColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 5)
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
//            Button {
//                withAnimation{
//                    presentLogoutAlert = true
//                }
//            } label: {
//                HStack{
//                    Image(systemName: "rectangle.portrait.and.arrow.right")
//                        .resizable()
//                        .frame(width: 22, height: 22)
//                        .foregroundColor(Theme.textDarkGraydColor)
//                    Text("Log Out")
//                        .foregroundColor(Theme.textDarkGraydColor)
//                        .font(.customFont(.InterRegular, 15))
//                        .padding(.leading, 4)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 75)
//            }
        }
    }
}

struct SlideMenuModuleView: View {
    
    var title: String = ""
    var icon: String = ""
    
    var body: some View {
        HStack(){
            VStack{
                Image(icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            }.padding()
                .background(RoundedRectangle(cornerRadius: 18).fill(Theme.whiteColor))
                .overlay(RoundedRectangle(cornerRadius: 18).strokeBorder(Theme.primaryColor, style: StrokeStyle(lineWidth: 1.0)))
            Text(title)
                .padding(.leading, 10)
            Spacer()
        }
        .foregroundColor(Theme.primaryColor)
        .padding(.vertical, 15)
        .padding(.horizontal, 0)
        .font(.customFont(.InterMedium, 15))
    }
}

struct SlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuView(menuxAxis: .constant(0))
    }
}

struct CloseButtonView: View {
    var onTap: (() -> Void)?
    var size: CGFloat = 30
    
    var body: some View {
        VStack{
            Button{
                onTap?()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(Theme.primaryColor)
                    .shadow(radius: 5)
            }
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        }
    }
}
