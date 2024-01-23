//
//  AuthHeader.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct AuthHeader: View {
    
    //for back
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    
    var title:String
    var body: some View {
        HStack {
            
            BackButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, color: Theme.primaryColor)
            
            Spacer()
            
            Text(title)
                .font(.customFont(.InterBold, 18))
            
            Spacer()
            
            HStack{}
                .frame(width: 40,height: 40)
            
        }//:HStack
        .padding(.horizontal,24)
    }
}

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader(title:"Login")
            .previewLayout(.sizeThatFits)
    }
}

