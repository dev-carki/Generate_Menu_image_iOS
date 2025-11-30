//
//  CreateMenuBoardUseCase.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/30/25.
//

import Foundation
import Factory

class CreateMenuBoardUseCase {
    let repository: GenerateMenuBoardRepository
    
    init(repository: GenerateMenuBoardRepository) {
        self.repository = repository
    }
    
    func execute(menus: [MenuCategory], storeID: Int) async -> Result<CodeitEmptyResponse, NetworkError> {
        return await self.repository.generateMenuBoard(menus: menus, storeID: storeID)
            .mapError{ $0.toNetworkError() }
    }
}
