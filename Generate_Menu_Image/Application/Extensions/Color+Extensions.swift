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
    
    //MARK: Design
    static let alertRed = Color(hex: "#E24343")
    static let alertFine = Color(hex: "#0AB663")
    static let gray100 = Color(hex: "#E8E8E8")
    static let primaryColor = Color(hex: "#A78CD3")
    static let secondaryColor = Color(hex: "#C3B1E1")
    static let myWhite = Color(hex: "#FFFFFF")
    static let myBlack = Color(hex: "#000000")
    static let myBlue: Color = Color(hex: "#008CC3")
    static let myGray = Color(hex: "#F5F5F5")
    static let myGray200: Color = Color(hex: "#DBDBDB")
    static let myGray600: Color = Color(hex: "#757575")
}
