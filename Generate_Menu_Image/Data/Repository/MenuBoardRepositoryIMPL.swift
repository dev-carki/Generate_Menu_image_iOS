//
//  MenuBoardRepositoryIMPL.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

class MenuBoardRepositoryIMPL: MenuBoardRepository {
    let api: MenuBoardAPI
    
    init(api: MenuBoardAPI) {
        self.api = api
    }
    
    func generateMenuImage(_ request: GenerateMenuBoardRequestModel) async -> Result<GenerateMenuResponseModel?, MenuBoardNetworkError> {
        return await api.generate_menu_image(request).map{ $0.data }
    }
}
