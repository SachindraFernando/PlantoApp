//
//  AuthTextField.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct AuthTextField: View {
    
    var hint: String
    var leadingImage: String = "ic_email"
    var trailingImages: String = "ic_check"
    var errorText: String
    var keyboard: UIKeyboardType = .default
    @Binding var text: String
    var isValidatorSucess: Bool
    
    // Binding to track whether the validation is currently valid
    @Binding var isValidationValid: Bool
    
    // State to track the border color of the text field
    @State var borderColor = Theme.textDarkGraydColor
    // State to show/hide the error message
    @State var showError = false
        
    
    var boarderColor: Color {
        if !isValidationValid && showError && !isValidatorSucess || !isValidatorSucess && isValidationValid {
            return Theme.redColor
        } else {
            return Theme.textDarkGraydColor
        }
    }
    
    var leadingIconColor: Color {
        if isValidationValid && !showError && isValidatorSucess || isValidatorSucess && !isValidationValid {
            return Theme.primaryColor
        }else if !isValidationValid && showError && !isValidatorSucess || !isValidatorSucess && isValidationValid{
            return Theme.redColor
        }else{
            return Theme.textDarkGraydColor
        }
    }

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                // Icon for the text field
                Image(leadingImage)
                    .foregroundColor(leadingIconColor)
                
                // Text field for user input
                TextField("", text: $text)
                    .font(.customFont(.InterRegular, 16))
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .placeholder(when: text.isEmpty) {
                        Text(hint)
                            .foregroundColor(Color.gray)
                            .font(.customFont(.InterRegular, 16))
                    }
                    .onChange(of: text, perform: { value in
                        showError = true
                        isValidationValid = false
                    })
                    .onTapGesture {
                        showError = true
                        isValidationValid = false
                    }
                
                // Validation icon
                if isValidationValid && !showError && isValidatorSucess || isValidatorSucess && !isValidationValid {
                    Image(trailingImages)
                        .foregroundColor(Theme.textDarkGraydColor)
                }
                
                
            } // HStack
            .padding()
            .background(RoundedRectangle(cornerRadius: 24).fill(Theme.whiteColor))
            .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(boarderColor, style: StrokeStyle(lineWidth: 1.0)))
            
            // Error message for invalid input
            if !isValidationValid && showError && !isValidatorSucess || !isValidatorSucess && isValidationValid {
                Text(errorText)
                    .foregroundColor(Color.red)
                    .font(.customFont(.InterMedium, 11))
            }
            
        } // VStack
     
       
    } // body
    
}

/*
struct AuthTextfieldTestView: View {
    
    @State var textFiled: String = ""
    @State var isEmailValid = false
    
    
    var body: some View {
        VStack {
          
            AuthTextField(hint: "Text", errorText: "*The password you entered is wrong", text: $textFiled, isValidatorSucess: Validators().isValidEmailValidator(value:textFiled).isSuccess, isValidationValid: $isEmailValid)

            Button {
                
                if textFiled.isEmpty {
                    isEmailValid = true
                }
                
                
            } label: {
                Text("Submit")
            }

        }
           
    }
    
}


struct AuthTextfField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(name:"Text", hint: "Text", errorText: "*The password you entered is wrong", text:.constant(""), isValidatorSucess: false, isValidationValid: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
 
 

 */

