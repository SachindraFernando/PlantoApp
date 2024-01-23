//
//  SuccessPopup.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct SuccessPopup: View {
    @Binding var isShowPopup:Bool
    var title :String
    var description :String
    var btnTitle:String
    var action: (() -> ())
    
    var body: some View {
        if isShowPopup {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowPopup.toggle()
                    }
                // This VStack is the popup
                VStack(spacing: 20) {
                    Image("ic_check")
                        .padding()
                        .frame(width: 102, height: 102)
                        .foregroundColor(Color.white)
                        .background(Theme.borderColor)
                        .clipShape(Circle())
                        .padding(.top,58)
                    
                    Text(title)
                        .font(.customFont(.InterBold, 20))
                        .padding(.top,40)
                    
                    Text(description)
                        .font(.customFont(.InterRegular, 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Theme.textDarkGraydColor)
                     
                    
                    Button(btnTitle) { action() }
                        .modifier(PrimaryBtnStyle(maxWidth:183,minHeight: 56))
                        .padding(.top,10)
                        .padding(.bottom,40)
                    
                    //for max width
                    HStack{Spacer()}
                }
                .padding(.horizontal,24)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal,24)
                .frame(minWidth: 327, minHeight:401)
                
            }//:ZStack
            
        }
    }
}

struct SuccessPopup_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(presentAlert: .constant(true), message: "Yeay!", cancelTitle: "hhh", confirmTitle: "kkk") {
            //
            print("HIIII")
        }
//        SuccessPopup(isShowPopup: .constant(true), title: "Yeay! Welcome Back", description: "Once again you login successfully into medidoc app", btnTitle: "Go to home") {
//
//        }
        
//        SuccessPopup(isShowPopup: .constant(true), title: "Success", description: "Your account has been successfully \nregistered", btnTitle: "Login") {
//
//        }

    }
}

struct CustomAlertView: View {
    @Binding var presentAlert:Bool
    var message :String
    var cancelTitle:String
    var confirmTitle: String
    var onTapOnConfirm: (() -> ())
    
    var body: some View {
        if presentAlert {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        presentAlert.toggle()
                    }
                // This VStack is the popup
                VStack(spacing: 20) {

                    Text(confirmTitle)
                        .font(.customFont(.InterBold, 20))
                        .padding(.top,40)
                    
                    Text(message)
                        .font(.customFont(.InterRegular, 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Theme.textDarkGraydColor)
                     
                    HStack(spacing: 10){
                        Button(confirmTitle) { onTapOnConfirm() }
                            .modifier(PrimaryBtnStyle(maxWidth:100,minHeight: 48))
                            .padding(.top,10)
                            .padding(.bottom,40)
                        
                        Button(cancelTitle) {
                            onTapOnConfirm()
                        }
                            .modifier(OutlineBtnStyle(maxWidth:100,minHeight: 48))
                            .padding(.top,10)
                            .padding(.bottom,40)
                    }
                    
                    //for max width
                    HStack{Spacer()}
                }
                .padding(.horizontal,24)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal,24)
                .frame(minWidth: 327, minHeight:401)
                
            }//:ZStack
            
        }
    }
}
