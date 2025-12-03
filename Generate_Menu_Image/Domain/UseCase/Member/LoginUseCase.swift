//
//  LoginUseCase.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation
import Factory

class LoginUseCase {
    let storeRepository: StoreRepository
    @Injected(\.appContext) var appContext
    
    init(storeRepository: StoreRepository) {
        self.storeRepository = storeRepository
    }
    
    func execute(store_id: Int) async -> Result<Void?, NetworkError> {
        let autoLoginResult = await self.storeRepository.getStoreWithID(store_id: store_id).mapError { $0.toNetworkError() }
        switch autoLoginResult {
        case .success(_):
            if let response = try? autoLoginResult.get() {
                appContext.storeName = String(response.name)
                appContext.storeID = response.id
                return .success(nil)
            }
            return .success(nil)
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
