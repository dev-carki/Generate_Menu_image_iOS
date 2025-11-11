//
//  DIContainer.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation
import Factory

extension Container {
    var networkService: Factory<NetworkService> {
        Factory(self) { NetworkService() }
    }
}

extension Container {
    var menuBoardNetworkService: Factory<MenuBoardNetworkService> {
        Factory(self) { MenuBoardNetworkService() }
    }
    
    var menuBoardAPI: Factory<MenuBoardAPI> {
        Factory(self) { MenuBoardAPI(networkService: self.menuBoardNetworkService(), host: AppConfig.apiBaseURL) }
    }
}

// MARK: Repository
extension Container {
    var generateMenuBoardRepository: Factory<MenuBoardRepository> {
        Factory(self) { MenuBoardRepositoryIMPL(api: self.menuBoardAPI()) }
    }
}

// MARK: UseCase - MenuBoard
extension Container {
    var generateMenuBoardUseCase: Factory<GenerateMenuBoardUseCase> {
        Factory(self) { GenerateMenuBoardUseCase(menuBoardRepository: self.generateMenuBoardRepository()) }
    }
}

// MARK: Helper - Regx ...
extension Container {
    
}
