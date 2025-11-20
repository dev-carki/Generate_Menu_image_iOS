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
//    case findID
//    case findPW
    case home
//    case setting
//    case changePassword
//    case accountInfo
//    case policy(onClickAgree: () -> (), type: PolicyType)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
        case .join:
            CreateStoreView()
//        case .findID:
//            FindIDView()
//        case .findPW:
//            FindPasswordView()
        case .home:
            MainView()
//        case .setting:
//            SettingView()
//        case .changePassword:
//            ChangePasswordView()
//        case .accountInfo:
//            AccountInfoView()
//        case .policy(let onClickAgree, let type):
//            PolicyView(vm: PolicyVM(type: type), onClickAgree: onClickAgree)
        }
    }
}
