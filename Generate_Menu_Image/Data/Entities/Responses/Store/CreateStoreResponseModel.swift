//
//  CreateStoreResponseModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/19/25.
//

import Foundation

struct CreateStoreResponseModel: Codable {
    let id: Int
    let created_at: String
    let updated_at: String
}

extension CreateStoreResponseModel {
    func toCreateStore() -> CreateStore {
        return CreateStore(
            id: self.id,
            created_date: self.created_at,
            updated_date: self.updated_at
        )
    }
}
