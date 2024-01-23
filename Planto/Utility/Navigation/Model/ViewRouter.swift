//
//  ViewRouter.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI


enum Roots {
    case initialScreen
    case signup
    case signIn
    case home
}


class ViewRouter: ObservableObject {
    
    @Published var currentRoot: Roots =  .initialScreen
    
    static let shared = ViewRouter()

    fileprivate init() {
        //check local user and logic
    }
    
}
