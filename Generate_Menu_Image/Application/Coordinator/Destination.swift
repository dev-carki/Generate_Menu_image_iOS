//
//  Destination.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

enum Destination {
    case login
    case join
    case home
    case showMenuBoard
    case createMenuBoard
    case addMenuItem(categoryToEdit: MenuCategory? = nil, onComplete: (MenuCategory) -> Void)
    
//    case policy(onClickAgree: () -> (), type: PolicyType)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
            
        case .join:
            CreateStoreView()
            
        case .home:
            MainView()
            
        case .showMenuBoard:
            MenuBoardView()
            
        case .createMenuBoard:
            CreateMenuBoardView()
            
        case .addMenuItem(let categoryToEdit, let onComplete):
            AddMenuItemView(categoryToEdit: categoryToEdit, onComplete: onComplete)
//        case .policy(let onClickAgree, let type):
//            PolicyView(vm: PolicyVM(type: type), onClickAgree: onClickAgree)
        }
    }
}
