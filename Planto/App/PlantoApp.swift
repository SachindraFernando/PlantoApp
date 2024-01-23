//
//  PlantoApp.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

@main
struct PlantoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ViewRouter.shared)
        }
    }
}
