//
//  StoreEndPoints.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/19/25.
//

import Foundation

final class StoreEndPoints {
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
