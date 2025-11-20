//
//  Color+Extensions.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    static let black: Color = Color(hex: "#1A1A1A")
    static let darkgray: Color = Color(hex: "#404040")
    static let line: Color = Color(hex: "#F4F5F7")
    static let underStroke: Color = Color(hex: "#E8E8E8")
    static let fail: Color = Color(hex: "#FF0000")
    static let success: Color = Color(hex: "#27AA74")
    static let successFlowchart: Color = Color(hex: "#00FF11")
    static let lightGreen: Color = Color(hex: "#89AB9D")
    static let graphMenu: Color = Color(hex: "#EEEEEF")
    
    static let gray700: Color = Color(hex: "#5C5C5C")
    static let gray600: Color = Color(hex: "#757575")
    static let gray500: Color = Color(hex: "#8F8F8F")
    static let gray400: Color = Color(hex: "#A8A8A8")
    static let gray300: Color = Color(hex: "#C2C2C2")
    static let gray200: Color = Color(hex: "#DBDBDB")
    static let gray100: Color = Color(hex: "#F5F5F5")
    
    static let green: Color = Color(hex: "#14583C")
    static let backgroundGreen: Color = Color(hex: "#0c372a")
}
