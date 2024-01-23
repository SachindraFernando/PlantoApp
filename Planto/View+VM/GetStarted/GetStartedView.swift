//
//  GetStartedView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct GetStartedView: View {
    @State  var isActiveLoginScreen: Bool = false
    @State  var isActiveSignUpScreen: Bool = false

    var body: some View {
        ZStack {
            VStack{
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            
                            Spacer()
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 90)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 5)
                                .foregroundColor(Theme.primaryColor)
                            
                            Text("Let’s get started!")
                                .font(.customFont(.AclonicaRegular, 32))
                                .foregroundColor(Theme.primaryColor)
                            
                            Text("Find best plants \neasily & quickly!")
                                .font(.customFont(.InterRegular, 20))
                                .kerning(2.5)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Theme.primaryColor)
                            
                            Button("Login") { isActiveLoginScreen.toggle() }
                            .modifier(PrimaryBtnStyle(maxWidth: 262))
                            
                            Button("Sign Up") { isActiveSignUpScreen.toggle() }
                                .modifier(OutlineBtnStyle(maxWidth: 262))
                            
                            
                            
                            Spacer()
                            
                        }//:VStack
                        .padding(.horizontal,32)
                        .frame(minHeight: geometry.size.height)
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                }//:GeometryReader
            }//:VStack
            
        }//:ZStack
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        .navigate(to: LoginView(),when: $isActiveLoginScreen)
        .navigate(to: SignUpView(),when: $isActiveSignUpScreen)

    }
    
}


struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
