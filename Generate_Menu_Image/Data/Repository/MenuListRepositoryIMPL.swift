//
//  MenuListRepositoryIMPL.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/26/25.
//

import Foundation

class MenuListRepositoryIMPL: MenuListRepository {
    let api: CodeitAPI
    
    init(api: CodeitAPI) {
        self.api = api
    }
    
    func getMenuListByStoreID(storeID: Int) async -> Result<[MenuListResponseModel], MenuBoardNetworkError> {
        return await api.getMenuListByStoreID(store_id: storeID).map{ $0.data }
    }
}
