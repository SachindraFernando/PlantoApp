//
//  RoundedShape.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-22.
//

import Foundation
import SwiftUI

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
