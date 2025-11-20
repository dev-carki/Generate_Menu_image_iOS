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
    
    var codeitAPI: Factory<CodeitAPI> {
        Factory(self) { CodeitAPI(networkService: self.codeItNetworkService(), host: AppConfig.apiBaseURL) }
    }
}

// MARK: Repository
extension Container {
    var generateMenuBoardRepository: Factory<MenuBoardRepository> {
        Factory(self) { MenuBoardRepositoryIMPL(api: self.codeitAPI()) }
    }
    
    var storeRepository: Factory<StoreRepository> {
        Factory(self) { StoreRepositoryIMPL(api: self.codeitAPI()) }
    }
}

// MARK: UseCase
extension Container {
    var generateMenuBoardUseCase: Factory<GenerateMenuBoardUseCase> {
        Factory(self) { GenerateMenuBoardUseCase(menuBoardRepository: self.generateMenuBoardRepository()) }
    }
    
    var createStoreUseCase: Factory<CreateStoreUseCase> {
        Factory(self) { CreateStoreUseCase(storeRepository: self.storeRepository()) }
    }
    
    var loginUseCase: Factory<LoginUseCase> {
        Factory(self) { LoginUseCase(storeRepository: self.storeRepository()) }
    }
}

// MARK: UseCase - Coordinator
extension Container {
}


// MARK: Helper - Regx ...
extension Container {
    var appContext: Factory<AppContext> {
        Factory(self) { AppContext() }.singleton
    }
}
