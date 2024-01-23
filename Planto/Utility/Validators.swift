//
//  Validators.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import Foundation
import Regex

enum ValidationStatus {
    case standard
    case success
    case failure(message: String)
    
    var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }
    var isFailed: Bool {
        if case .failure = self {
            return true
        }
        return false
    }
}


class Validators {
    
    func nonEmptyValidator(value : String, value2 : String? = nil)-> ValidationStatus {
        if(value.count > 0){
           return .success
        }
        
        return .failure(message: "Cannot be empty")
    }
    
    
    func isValidPasswordValidator(value : String, value2 : String? = nil)-> ValidationStatus {
        if(value.count > 7){
           return .success
        }
        
        return .failure(message: "Must be 8 characters or more")
    }
    
    
    func confirmPasswordValidator(value : String, value2 : String?)-> ValidationStatus {
        if(value.count < 7){
            return .failure(message: "Must be 8 digit or more")
        }
        if(value != value2){
            return .failure(message: "Password mismatch")
        }
        return .success
    }


    func matcherValidator(value : String, value2 : String) -> ValidationStatus {
        let regex : Regex  = value2.r!

        guard regex.matches(value) else {
                return .failure(message: "")
            }
        return .success
    }
    
    func isValidEmailValidator(value : String, value2 : String? = nil) -> ValidationStatus {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let regex : Regex  = pattern.r!
        
        guard regex.matches(value) else {
                return .failure(message: " Invalid email address")
            }
        return .success
    }
    
    
    func isValidCharacterValidator(value : String, value2 : String? = nil) -> ValidationStatus {
        let pattern = "^(?=\\S{1})[a-zA-Z]\\w*(?:\\.\\w+)*(?:@\\w+\\.\\w{2,4})?$"

        let regex : Regex  = pattern.r!

        
        guard regex.matches(value) else {
                return .failure(message: "Please use valid character")
            }
        return .success
    }
    
    
    func isValidMaxCharacterValidator(value : String, value2 : String? = nil) -> ValidationStatus {
        
        let pattern = "^.{0,200}$"

        let regex : Regex  = pattern.r!

        guard regex.matches(value) else {
                return .failure(message: "Please use less than 200 character")
            }
        return .success
    }
    
    func isValidPhoneNumberValidator(value: String, value2: String? = nil) -> ValidationStatus {
        let pattern = "^[0-9+]{0,1}+[0-9]{5,16}$" // Matches phone numbers with at least 6 digits, optionally starting with a + symbol
        let regex: Regex = pattern.r!
        
        guard regex.matches(value) else {
            return .failure(message: "Invalid phone number")
        }
        
        return .success
    }
    

}

