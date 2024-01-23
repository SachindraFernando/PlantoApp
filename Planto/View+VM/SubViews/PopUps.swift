//
//  PopUps.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-10.
//

import SwiftUI

enum TransitionStyle {
    case crossDissolve
    case coverVertical
    // Add more cases if needed
}

func anyTransition(for style: TransitionStyle) -> AnyTransition {
    switch style {
    case .crossDissolve:
        return AnyTransition.opacity.animation(.easeInOut(duration: 0.3))
    case .coverVertical:
        let insertion = AnyTransition.move(edge: .bottom).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .bottom).combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


struct Popup<T: View>: ViewModifier {
    let popup: T
    let alignment: Alignment
    let direction: Direction
    let isPresented: Bool
    let transition: AnyTransition

    init(isPresented: Bool, alignment: Alignment, direction: Direction, transition: AnyTransition = .identity, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        self.alignment = alignment
        self.direction = direction
        self.transition = transition
        popup = content()
    }

    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    @ViewBuilder
    private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .animation(.spring())
                    .transition(transition)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
}

extension Popup {
    enum Direction {
        case top, bottom

        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveScreenEdge = -popupFrame.maxY
                return aboveScreenEdge
            case .bottom:
                let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                return belowScreenEdge
            }
        }
    }
}

extension View {
    func popup<T: View>(
        isPresented: Bool,
        alignment: Alignment = .center,
        direction: Popup<T>.Direction = .bottom,
        transitionStyle: TransitionStyle = .crossDissolve,
        @ViewBuilder content: () -> T
    ) -> some View {
        let transition = anyTransition(for: transitionStyle)
        return modifier(Popup(isPresented: isPresented, alignment: alignment, direction: direction, transition: transition, content: content))
    }
}


private extension View {
    func onGlobalFrameChange(_ onChange: @escaping (CGRect) -> Void) -> some View {
        background(GeometryReader { geometry in
            Color.clear.preference(key: FramePreferenceKey.self, value: geometry.frame(in: .global))
        })
        .onPreferenceChange(FramePreferenceKey.self, perform: onChange)
    }

    func print(_ varargs: Any...) -> Self {
        Swift.print(varargs)
        return self
    }
}

private struct FramePreferenceKey: PreferenceKey {
    static let defaultValue = CGRect.zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

private extension View {
    @ViewBuilder func applyIf<T: View>(_ condition: @autoclosure () -> Bool, apply: (Self) -> T) -> some View {
        if condition() {
            apply(self)
        } else {
            self
        }
    }
}

