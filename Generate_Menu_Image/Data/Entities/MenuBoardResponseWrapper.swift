//
//  MenuBoardResponseWrapper.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

struct MenuBoardResponseWrapper<T: Codable>: Codable {
    let code: Int
    let message: String
    let data: T?
}
