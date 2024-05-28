//
//  Color+Extensions.swift
//  StudioGhibli-SwiftUI
//
//  Created by Farhana Mustafa on 5/27/24.
//

import Foundation
import SwiftUI

extension Color {
    static func randomPastelColor() -> Color {
        let pastelColors = [
            Color.pink.opacity(0.3),
            Color.green.opacity(0.3),
            Color.blue.opacity(0.3),
            Color.purple.opacity(0.3)
        ]
        return pastelColors.randomElement() ?? Color.pink.opacity(0.3)
    }
}
