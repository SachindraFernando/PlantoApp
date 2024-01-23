//
//  LoginVM.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import Foundation

class LoginVM:BaseVM {
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var confirmPasswordText = ""
    
    @Published var showPopup = false
    @Published var isEmailValidationValid = false
    @Published var isPasswordValidationValid = false

}

extension LoginVM {
    //MARK: - VALIDATION
    func proceedWithSignIn() -> Bool {
        var status = true
        if emailText.isEmpty {
            isEmailValidationValid = true
            status = false
        }
        if !Validators().isValidEmailValidator(value: emailText).isSuccess {
            isEmailValidationValid = true
            status = false
        }
        if passwordText.isEmpty {
            isPasswordValidationValid = true
            status = false
        }
        if !Validators().isValidPasswordValidator(value: passwordText).isSuccess {
            isPasswordValidationValid = true
            status = false
        }
        return status
    }
    
}

