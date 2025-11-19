//
//  GenerateMenuBoardRequestModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

struct GenerateMenuBoardRequestModel: Codable {
    let prompt: String
    let style: String
}

// TODO: 삭제
struct TempModel: Codable {
    let menu_name: String
    let menu_price: String
    let menu_image: String
}
