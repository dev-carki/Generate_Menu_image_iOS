//
//  GetStoreResponseModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

struct GetStoreResponseModel: Codable {
    let id: Int
    let name: String
    let address: String
    let phone: String
    let open_time: String
    let close_time: String
    let created_at: String
    let updated_at: String
}

extension GetStoreResponseModel {
    func toGetStore() -> GetStore {
        return GetStore(
            id: self.id,
            name: self.name,
            address: self.address,
            phone: self.phone,
            open_time: self.open_time,
            close_time: self.close_time,
            created_at: self.created_at,
            updated_at: self.updated_at
        )
    }
}
