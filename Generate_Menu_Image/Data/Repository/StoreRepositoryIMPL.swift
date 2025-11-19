//
//  StoreRepositoryIMPL.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

class StoreRepositoryIMPL: StoreRepository {
    let api: StoreAPI
    
    init(api: StoreAPI) {
        self.api = api
    }
    
    func createStore(_ request: CreateStoreRequestModel) async -> Result<CreateStoreResponseModel?, MenuBoardNetworkError> {
        return await api.create_store(request).map{ $0.data }
    }
}
