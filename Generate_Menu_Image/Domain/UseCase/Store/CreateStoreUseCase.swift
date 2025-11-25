//
//  CreateStoreUseCase.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

final class CreateStoreUseCase {
    let storeRepository: StoreRepository
    
    init(storeRepository: StoreRepository) {
        self.storeRepository = storeRepository
    }
    
    func execute(_ request: CreateStoreRequestModel) async -> Result<CreateStore, NetworkError> {
        return await self.storeRepository.createStore(request)
            .map({ $0.toCreateStore() })
            .mapError({$0.toNetworkError()})
    }
}
