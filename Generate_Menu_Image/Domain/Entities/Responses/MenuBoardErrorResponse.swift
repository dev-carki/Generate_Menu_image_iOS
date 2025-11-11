//
//  MenuBoardErrorResponse.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

struct MenuBoardErrorResponse: Error, Codable {
    let code: String
    let message: String
    let status: Int
    let success: Bool
}
