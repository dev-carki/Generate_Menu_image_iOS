//
//  MenuBoardRepository.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

protocol MenuBoardRepository {
    func generateMenuImage(_ request: GenerateMenuBoardRequestModel) async -> Result<GenerateMenuResponseModel?, MenuBoardNetworkError>
}
