//
//  Font+Extensions.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

enum CustomFont: String {
    case bold = "Pretendard-Bold"
    case regular = "Pretendard-Regular"
    case semiBold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"
}

extension Font {
    //MARK: App
    static let inputTitle: Font = .custom(CustomFont.semiBold.rawValue, size: 13)
    static let inputbox: Font = .custom(CustomFont.regular.rawValue, size: 16)
    static let inputError: Font = .custom(CustomFont.regular.rawValue, size: 11)
    static let headline: Font = .custom(CustomFont.bold.rawValue, size: 24)
    static let gnbText: Font = .custom(CustomFont.bold.rawValue, size: 16)
    static let tabletButton: Font = .custom(CustomFont.medium.rawValue, size: 28)
    static let menu: Font = .custom(CustomFont.medium.rawValue, size: 14)
    static let inputSub: Font = .custom(CustomFont.semiBold.rawValue, size: 10)
    static let titleMenu: Font = .custom(CustomFont.semiBold.rawValue, size: 20)
    static let menuBold: Font = .custom(CustomFont.semiBold.rawValue, size: 14)
    static let caption: Font = .custom(CustomFont.regular.rawValue, size: 12)
    
    //MARK: PopUp
    static let title: Font = .custom(CustomFont.bold.rawValue, size: 19)
    static let button: Font = .custom(CustomFont.regular.rawValue, size: 14)
    static let sub: Font = .custom(CustomFont.regular.rawValue, size: 13)
}
