//
//  ApiError.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

enum ApiError: Error {
    case customError(data: Data)
    case serverError
    case parsingError
    case afError
    case timeoutError
}
