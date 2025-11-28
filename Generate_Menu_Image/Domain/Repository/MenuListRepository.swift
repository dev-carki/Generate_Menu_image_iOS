//
//  MenuListRepository.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/26/25.
//

import Foundation

protocol MenuListRepository {
    func getMenuListByStoreID(storeID: Int) async -> Result<[MenuListResponseModel], MenuBoardNetworkError>
}
