//
//  MenuBoardAPI.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation
import Alamofire

class MenuBoardAPI {
    var host: String
    let networkService: MenuBoardNetworkService
    
    init(networkService: MenuBoardNetworkService, host: String) {
        self.networkService = networkService
        self.host = host
    }
}

// MARK: Menu API
extension MenuBoardAPI {
    func generate_menu_image(_ request: GenerateMenuBoardRequestModel) async -> Result<MenuBoardResponseWrapper<GenerateMenuResponseModel>, MenuBoardNetworkError> {
        let body = request.toDictionary()
        return await self.networkService.post(self.host, url: MenuBoardEndPoints.MenuBoard.CreateMenuImage.url, httpBody: body)
    }
}
