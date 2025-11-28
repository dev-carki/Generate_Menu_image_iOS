//
//  CreateMenuBoardViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import Foundation

final class CreateMenuBoardViewModel: ObservableObject {
    @Published var isCreateSuccess: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var categoryToDelete: MenuCategory? = nil
    @Published var menuItems: [MenuCategory] = []
}
