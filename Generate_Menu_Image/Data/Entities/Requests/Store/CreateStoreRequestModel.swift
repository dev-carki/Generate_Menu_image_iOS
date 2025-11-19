//
//  CreateStoreRequestModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/19/25.
//

import Foundation

struct CreateStoreRequestModel: Codable {
    let name : String
    let address : String
    let phone : String
    let open_time : String
    let close_time : String
}
