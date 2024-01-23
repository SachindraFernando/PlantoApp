//
//  LoginView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct LoginView: View {
    //MARK: - PROPERITY
    @StateObject var viewModel = LoginVM()
    
    @State  var isActiveSignUpScreen: Bool = false
    @State  var isActiveHomeScreen: Bool = false
    @State  var isForgotPasswordHomeScreen: Bool = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            
            VStack{
                
                AuthHeader(title:"Login")
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 16) {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 90)
                                .frame(maxWidth: .infinity)
                                .padding(.top, 5)
                                .foregroundColor(Theme.primaryColor)
                            
                            AuthTextField(hint: "Enter your username/ email", errorText: "*Please enter a valid email", text:$viewModel.emailText, isValidatorSucess: Validators().isValidEmailValidator(value:  viewModel.emailText).isSuccess, isValidationValid: $viewModel.isEmailValidationValid)
                              
                            AuthPasswordField(hint: "Enter your password", errorText: "*Please enter a valid password", text:$viewModel.passwordText, isValidatorSucess: Validators().isValidPasswordValidator(value:  viewModel.passwordText).isSuccess, isValidationValid: $viewModel.isPasswordValidationValid)
                            
                            HStack{
                                Spacer()
                                Text("Forgot Password?")
                                    .foregroundColor(Theme.primaryColor)
                                    .font(.customFont(.InterMedium, 14))
                                    .onTapGesture {
                                        isForgotPasswordHomeScreen.toggle()
                                    }
                            }//:HStack
                            
                            
                            Button("Login") { loginBtnTap() }
                                .modifier(PrimaryBtnStyle(maxWidth: .infinity,minHeight: 56))
                                .padding(.top,32)
                            
                            HStack(spacing: 0) {
                                Text("Don’t have an account?")
                                Text(" Sign Up")
                                    .foregroundColor(Theme.primaryColor)
                                    .onTapGesture{
                                        isActiveSignUpScreen.toggle()
                                    }
                        
                            }
                            .foregroundColor(Theme.textDarkGraydColor)
                            .font(.customFont(.InterRegular, 15))
                            .padding(.top,24)
                            
                            Spacer()
                            
                        }//:VStack
                        .padding(.horizontal,24)
                        .padding(.vertical,24)
                        .frame(minHeight: geometry.size.height)
                        
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                    
                }//:GeometryReader
                
            }//:VStack
            
            //popup
         

        }//:ZStack
        .navigationBarHidden(true)
        .modifier(DismissingKeyboard())
        .navigate(to: EmptyView(),when: $isForgotPasswordHomeScreen)
        .navigate(to: SignUpView(),when: $isActiveSignUpScreen)
        .navigate(to: HomeView(),when: $isActiveHomeScreen)
    }
 
    func loginBtnTap(){
        if !viewModel.proceedWithSignIn() {
            return
        }
        
        //api call
        isActiveHomeScreen.toggle()
    }
}

//MARK: - PREVIEWS
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

