//
//  CodeitEndpoints.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

final class CodeitEndpoints {
    
}
// MARK: Menu_List
extension CodeitEndpoints {
    enum MenuList: EndPoint {
        case getMenuListByStoreID(id: Int)
        
        var url: String {
            switch self {
            case .getMenuListByStoreID(let id):
                return "/api/v1/menus/store/\(id)"
            }
        }
    }
}

// MARK: Auth
extension CodeitEndpoints {
    enum Store: EndPoint {
        case CreateStore
        case GetAllStore
        case GetStoreWithId(id: Int)
        
        var url: String {
            switch self {
            case .CreateStore:
                return "/api/v1/store"
            case .GetAllStore:
                return "/api/v1/store"
            case .GetStoreWithId(let id):
                return "/api/v1/store/\(id)"
            }
        }
    }
}

extension CodeitEndpoints {
    enum GenerateMenuBoard: EndPoint {
        case generateMenuBoard
        
        var url: String {
            switch self {
            case .generateMenuBoard:
                return "/api/v1/menus/generation"
            }
        }
    }
}

extension CodeitEndpoints {
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
