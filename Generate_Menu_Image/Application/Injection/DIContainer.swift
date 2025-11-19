//
//  DIContainer.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation
import Factory

extension Container {
    var baseNetworkService: Factory<BaseNetworkservice> {
        Factory(self) { BaseNetworkservice() }
    }
}

extension Container {
    var codeItNetworkService: Factory<CodeItNetworkService> {
        Factory(self) { CodeItNetworkService() }
    }
    
    var menuBoardAPI: Factory<MenuBoardAPI> {
        Factory(self) { MenuBoardAPI(networkService: self.codeItNetworkService(), host: AppConfig.apiBaseURL) }
    }
    
    var storeAPI: Factory<StoreAPI> {
        Factory(self) { StoreAPI(networkService: self.codeItNetworkService(), host: AppConfig.apiBaseURL) }
    }
}

// MARK: Repository
extension Container {
    var generateMenuBoardRepository: Factory<MenuBoardRepository> {
        Factory(self) { MenuBoardRepositoryIMPL(api: self.menuBoardAPI()) }
    }
    
    var storeRepository: Factory<StoreRepository> {
        Factory(self) { StoreRepositoryIMPL(api: self.storeAPI()) }
    }
}

// MARK: UseCase - MenuBoard
extension Container {
    var generateMenuBoardUseCase: Factory<GenerateMenuBoardUseCase> {
        Factory(self) { GenerateMenuBoardUseCase(menuBoardRepository: self.generateMenuBoardRepository()) }
    }
    
    var createStoreUseCase: Factory<CreateStoreUseCase> {
        Factory(self) { CreateStoreUseCase(storeRepository: self.storeRepository()) }
    }
}

// MARK: Helper - Regx ...
extension Container {
    
}
