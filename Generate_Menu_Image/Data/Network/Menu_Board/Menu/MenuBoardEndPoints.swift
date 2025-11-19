//
//  MenuBoardEndPoints.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

final class MenuBoardEndPoints {
    enum MenuBoard: EndPoint {
        case CreateMenuImage
        case CreateMenuImageWithReference
        case GetAllMenuImage
        case GetAllMenuImageWithId(id: Int)
        
        var url: String {
            switch self {
            case .CreateMenuImage:
                return "/api/v1/menu/images"
            case .CreateMenuImageWithReference:
                return "/api/v1/menu/images/reference"
            case .GetAllMenuImage:
                return "/api/v1/menu"
            case .GetAllMenuImageWithId(let id):
                return "/api/v1/menu/\(id)"
            }
        }
    }
}
