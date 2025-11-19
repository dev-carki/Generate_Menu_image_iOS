//
//  StoreAPI.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/19/25.
//

import Foundation
import Alamofire

class StoreAPI {
    var host: String
    let networkService: CodeItNetworkService
    
    init(networkService: CodeItNetworkService, host: String) {
        self.networkService = networkService
        self.host = host
    }
}

// MARK: Menu API
extension StoreAPI {
    func create_store(_ request: CreateStoreRequestModel) async -> Result<MenuBoardResponseWrapper<CreateStoreResponseModel>, MenuBoardNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: StoreEndPoints.Store.CreateStore.url, httpBody: body)
    }
}
