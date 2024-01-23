//
//  ContactCard.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import SwiftUI

struct ContactsCard: View {
    var personModel: PersonModel
    var action: (() -> ())
    var body: some View {
        HStack {
            Image(personModel.image)
                .resizable()
                .frame(width: 50,height:
                        50)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            VStack(alignment: .leading,spacing: 8){
                
                HStack {
                    Text(personModel.name)
                        .font(.customFont(.InterMedium, 14))
                    
                    Spacer()
                    
                }//:HStack
                HStack {
                    Text(personModel.name)
                        .foregroundColor(Theme.textDarkGraydColor)
                        .font(.customFont(.InterMedium, 12))
                    Spacer()
                }//:HStack
                
            }
        }//;HStack
        .onTapGesture{
            action()
        }
    }
}


