//
//  StoreRepository.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

protocol StoreRepository {
    func createStore(_ request: CreateStoreRequestModel) async -> Result<CreateStoreResponseModel?, MenuBoardNetworkError>
    
    func getStoreWithID(store_id: Int) async -> Result<GetStoreResponseModel?, MenuBoardNetworkError>
}
