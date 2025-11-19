//
//  GenerateMenuBoardUseCase.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

final class GenerateMenuBoardUseCase {
    let menuBoardRepository: MenuBoardRepository
    
    init(menuBoardRepository: MenuBoardRepository) {
        self.menuBoardRepository = menuBoardRepository
    }
    
    func execute(_ request: GenerateMenuBoardRequestModel) async -> Result<GenerateMenu?, NetworkError> {
        return await self.menuBoardRepository.generateMenuImage(request)
            .map({ $0?.toGenerateMenu() })
            .mapError({$0.toNetworkError()})
    }
}
