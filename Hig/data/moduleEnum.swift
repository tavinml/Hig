//
//  moduleEnum.swift
//  Hig
//
//  Created by Ana Soares on 08/06/26.
//

import Foundation
import SwiftUI

enum Module: String, Codable, CaseIterable {
    case layout, colors, materials
    
    var colorValue: Color {
        switch self {
        case .layout: return .colorLayout
        case .colors: return .colorColors
        case .materials: return .colorMaterials
        }
    }
}
