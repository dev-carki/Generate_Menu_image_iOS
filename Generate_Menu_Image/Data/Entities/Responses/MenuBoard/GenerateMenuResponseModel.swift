//
//  GenerateMenuResponseModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

struct GenerateMenuResponseModel: Codable {
    let id: String
    let image_url: String
    let created_at: String
}

extension GenerateMenuResponseModel {
    func toGenerateMenu() -> GenerateMenu {
        GenerateMenu(
            id: self.id,
            image: self.image_url,
            created_date: self.created_at
        )
    }
}
