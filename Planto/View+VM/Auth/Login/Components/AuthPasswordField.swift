//
//  AuthPasswordField.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI


struct AuthPasswordField: View {
    
    var hint: String
    var leadingImage: String = "ic_lock"
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
    
    @State var isToggleOn = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                // Icon for the text field
                Image(leadingImage)
                    .foregroundColor(leadingIconColor)
                
                // Text field for user input
                
                Group{
                    if self.isToggleOn{
                        TextField("", text: $text)
                    }else{
                        SecureField("", text: $text)
                    }
                }//:Group
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .font(.customFont(.InterRegular, 16))
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
                //                if isValidationValid && !showError && isValidatorSucess || isValidatorSucess && !isValidationValid {
                //                    Image(trailingImages)
                //                }
                
                // toggle icon
                Button {
                    isToggleOn.toggle()
                } label: {
                    Image(isToggleOn ? "ic_eye":"ic_eye_close")
                        .resizable()
                        .frame(width: 24,height: 24)
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
 struct AuthPasswordFieldTestView: View {
 
 @State var textFiled: String = ""
 @State var isEmailValid = false
 
 var body: some View {
 VStack {
 
 AuthPasswordField( hint: "Text", errorText: "*The password you entered is wrong", text: $textFiled, isValidatorSucess: Validators().isValidEmailValidator(value:textFiled).isSuccess, isValidationValid: $isEmailValid)
 
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
 
 
 
 struct AuthPasswordField_Previews: PreviewProvider {
 static var previews: some View {
 AuthPasswordFieldTestView()
 }
 }
 
 */

