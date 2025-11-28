//
//  MenuListResponseModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/26/25.
//
import Foundation

struct MenuListResponseModel: Codable {
    let menu_id: Int
    let menu_name: String
    let menu_description: String
    let items: [ItemResponseModel]
}

struct ItemResponseModel: Codable {
    let id: Int
    let name, description: String
    let price: Int
    let is_available: Bool
    let image_url: String?
}

extension MenuListResponseModel {
    func toMenuList() -> MenuList {
        return MenuList(
            id: menu_id,
            categoryName: menu_name,
            categoryDesc: menu_description,
            items: items.map { $0.toMenuListItem() }
        )
    }
}

extension ItemResponseModel {
    func toMenuListItem() -> MenuListItem {
        return MenuListItem(
            id: id,
            menuName: name,
            menuDesc: description,
            menuPrice: price,
            menuAvailable: is_available,
            menuImage: image_url ?? ""
        )
    }
}
