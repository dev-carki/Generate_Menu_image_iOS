//
//  LoginViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation
import Factory

final class LoginViewModel: ObservableObject {
    @Injected(\.loginUseCase) var loginUseCase
    
    @Published var loginID: String = ""
    @Published var isLoginTrying: Bool = false
    @Published var isLoginSuccess: Bool = false
    @Published var loginErrorText: String = ""
    
    
    func login() async {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.isLoginTrying = true
        }
        
        guard let id = Int(self.loginID) else { return }
        
        let loginResult = await self.loginUseCase.execute(store_id: id)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch loginResult {
            case .success(let success):
                self.isLoginSuccess = true
                self.loginErrorText = ""
            case .failure(let failure):
                self.isLoginSuccess = false
                self.loginErrorText = "잘못된 ID를 입력하셨습니다"
            }
            
            self.isLoginTrying = false
        }
    }
}
