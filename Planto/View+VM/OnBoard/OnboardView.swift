//
//  OnboardView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct OnboardView: View {
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPages{
            GetStartedView()
        }else{
            WalkthroughScreen()
        }
    }
}


var totalPages = 3

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
