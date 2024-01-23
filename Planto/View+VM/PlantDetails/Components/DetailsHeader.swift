//
//  DetailsHeader.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct DetailsHeader: View {
    //for back
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var title:String
    var trailingImg:String
    var trailingAction: (() -> ())

    var body: some View {
        HStack {
            
            BackButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, color: Color.black)
            
            Spacer()
            
            Text(title)
                .font(.customFont(.InterBold, 18))
            
            Spacer()
            
            HStack{
                Button(action: {
                    trailingAction()
                           }) {
                               Image(trailingImg)
                                   .foregroundColor(Theme.blackColor)
                       }
             
            }//:HStack
           .frame(width: 40,height: 40)
            
        }//:HStack
        .padding(.horizontal,24)
    }
}

struct DetailsHeader_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHeader(title: "",trailingImg: ""){
            
        }
    }
}
