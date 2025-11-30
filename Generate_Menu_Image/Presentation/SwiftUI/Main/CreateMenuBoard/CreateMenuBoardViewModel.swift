//
//  CreateMenuBoardViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import Foundation

import Factory

final class CreateMenuBoardViewModel: ObservableObject {
    @Injected(\.createMenuBoardUseCase) var createMenuBoardUseCase
    @Published var isCreateing: Bool = false
    @Published var isCreateSuccess: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var categoryToDelete: MenuCategory? = nil
    @Published var menuItems: [MenuCategory] = []
    
    func createMenuBoard() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.isCreateing = true
        }
        
        let result = await self.createMenuBoardUseCase.execute(menus: menuItems, storeID: 1)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.isCreateSuccess = true
                
            case .failure(let error):
                self.isCreateSuccess = false
                print(error)
            }
            self.isCreateing = false
        }
    }
}
