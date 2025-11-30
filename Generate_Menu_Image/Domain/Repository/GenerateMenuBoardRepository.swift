//
//  GenerateMenuBoardRepository.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/30/25.
//

import Foundation

protocol GenerateMenuBoardRepository {
    func generateMenuBoard(menus: [MenuCategory], storeID: Int) async -> Result<CodeitEmptyResponse, MenuBoardNetworkError>
}

