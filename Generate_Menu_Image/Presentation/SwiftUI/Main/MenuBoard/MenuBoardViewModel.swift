//
//  MainViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

import Factory

final class MenuBoardViewModel: ObservableObject {
    @Injected(\.getAllMenuListUseCase) var getAllMenuListUseCase
    
    @Published var menuLists: [MenuList] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    
    func getAllMenuList(storeId: Int = 1) async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = ""
        }
        
        let result = await self.getAllMenuListUseCase.execute(store_id: storeId)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let response):
                self.menuLists = response
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
