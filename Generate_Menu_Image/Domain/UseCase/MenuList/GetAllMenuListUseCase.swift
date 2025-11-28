//
//  GetAllMenuListUseCase.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/26/25.
//

import Foundation
import Factory

class GetAllMenuListUseCase {
    let menuListRepository: MenuListRepository
    
    init(menuListRepository: MenuListRepository) {
        self.menuListRepository = menuListRepository
    }
    
    func execute(store_id: Int) async -> Result<[MenuList], NetworkError> {
        return await self.menuListRepository.getMenuListByStoreID(storeID: store_id)
            .map{ response in
                response.map{ $0.toMenuList() }
            }
            .mapError{ $0.toNetworkError() }
    }
}
