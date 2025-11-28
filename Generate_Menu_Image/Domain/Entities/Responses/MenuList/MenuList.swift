//
//  MenuList.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/26/25.
//

import Foundation

struct MenuList: Identifiable {
    let id: Int
    let categoryName: String
    let categoryDesc: String
    let items: [MenuListItem]
}

struct MenuListItem: Identifiable {
    let id: Int
    let menuName: String
    let menuDesc: String
    let menuPrice: Int
    let menuAvailable: Bool
    let menuImage: String
}
