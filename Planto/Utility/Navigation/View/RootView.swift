//
//  RootView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var router: ViewRouter
    @State var isAnimated = false
    
    var body: some View {
        NavigationView {
            containedView(roots: router.currentRoot)
                .id(UUID().uuidString)
                .transition(.slide).animation(.linear(duration: 0.2), value: isAnimated)
                .onAppear() {
                    DispatchQueue.main.async {
                        isAnimated = true
                    }
                }
        }//:NavigationView
        .navigationViewStyle(.stack)
    }
    
    func containedView(roots: Roots) -> AnyView {
        switch router.currentRoot {
        case .initialScreen:
            return AnyView(OnboardView())
        case .signup:
            return AnyView(EmptyView())
            //return AnyView(SignUpView())
        case .signIn:
            return AnyView(LoginView())
        case .home:
            return AnyView(HomeView())
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(ViewRouter.shared)
    }
}

