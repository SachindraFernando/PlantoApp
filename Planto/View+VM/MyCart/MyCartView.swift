//
//  MyCartView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct MyCartView: View {
    @State  var showConfimPop: Bool = false

    var body: some View {
        
        ZStack {
            VStack{
                AuthHeader(title:"My Cart")
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            CartCard(plant: dummyPlantModel)
                            
                            CartCard(plant: dummyPlantModelTwo)
                            Spacer()
                            paymentDetail
                            
                            
                            paymentBtn
                        }//:VStack
                        .padding(.horizontal,24)
                        .frame(minHeight: geometry.size.height)
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                }//:GeometryReader
            }//:VStack
 
            
        }//:ZStack
        .navigationBarHidden(true)
        .popup(isPresented:  showConfimPop, alignment: .center, direction: .bottom,transitionStyle: .crossDissolve) {
            SuccessPopup(isShowPopup: $showConfimPop, title: "Payment Success", description: "Your payment has been successful", btnTitle: "Done") {

                ViewRouter.shared.currentRoot = .home
            }
        }
    }
    
}



extension MyCartView {
    var paymentDetail: some View {
        VStack(spacing: 12) {
            
            HStack {
                Text("Subtotal")
                    .font(.customFont(.InterRegular, 14))
                    .foregroundColor(Theme.textDarkGraydColor)
                
                Spacer()
                Text("$60.00")
                    .font(.customFont(.InterRegular, 14))
                    .foregroundColor(Theme.blackColor)
                
            }//:HStack
            
            HStack {
                Text("Discounts")
                    .font(.customFont(.InterRegular, 14))
                    .foregroundColor(Theme.textDarkGraydColor)
                
                Spacer()
                Text("$1.00")
                    .font(.customFont(.InterRegular, 14))
                    .foregroundColor(Theme.blackColor)
                
            }//:HStack
            
            HStack {
                Text("Total")
                    .font(.customFont(.InterBold, 14))
                    .foregroundColor(Theme.blackColor)
                
                Spacer()
                Text("$59.00")
                    .font(.customFont(.InterBold, 14))
                    .foregroundColor(Theme.blackColor)
                
            }//:HStack
            
        }//:HStack

    }
}
extension MyCartView {
    
    var paymentBtn: some View {
        
        HStack{
            Button("Buy Now") { showConfimPop.toggle() }
                .modifier(PrimaryBtnStyle(maxWidth: .infinity,minHeight: 56))
                .padding(.top,32)
        }//:HStack
        
    }
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
