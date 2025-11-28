//
//  CodeitAPI.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

class CodeitAPI {
    var host: String
    let networkService: CodeItNetworkService
    
    init(networkService: CodeItNetworkService, host: String) {
        self.networkService = networkService
        self.host = host
    }
}
// MARK: Auth
extension CodeitAPI {
    func create_store(_ request: CreateStoreRequestModel) async -> Result<MenuBoardResponseWrapper<CreateStoreResponseModel>, MenuBoardNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: CodeitEndpoints.Store.CreateStore.url, httpBody: body)
    }
    
    func getStoreWithId(id: Int) async -> Result<MenuBoardResponseWrapper<GetStoreResponseModel>, MenuBoardNetworkError> {
        return await self.networkService.get(self.host, url: CodeitEndpoints.Store.GetStoreWithId(id: id).url)
    }
}

// MARK: Menu API
extension CodeitAPI {
    func generate_menu_image(_ request: GenerateMenuBoardRequestModel) async -> Result<MenuBoardResponseWrapper<GenerateMenuResponseModel>, MenuBoardNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: CodeitEndpoints.MenuBoard.CreateMenuImage.url, httpBody: body)
    }
}


// MARK: Menu_List API
extension CodeitAPI {
    func getMenuListByStoreID(store_id: Int) async -> Result<MenuBoardResponseWrapper<[MenuListResponseModel]>, MenuBoardNetworkError> {
        return await self.networkService.get(self.host, url: CodeitEndpoints.MenuList.getMenuListByStoreID(id: store_id).url)
    }
}
