//
//  MenuBoardNetworkError.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

enum MenuBoardNetworkError: String, Error {
    //MARK: COMMON
    case UNKNOWN
    case PARSING
    case AFERROR
    
    func toNetworkError() -> NetworkError {
        return NetworkError(rawValue: self.rawValue) ?? NetworkError.UNKNOWN
    }
}

