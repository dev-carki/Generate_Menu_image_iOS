//
//  SplashViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation
import Factory

final class SplashViewModel: ObservableObject {
//    @Injected(\.autoLoginUseCase) var autoLoginUseCase
//    @Published var isAvailableToMoveMain: Bool = false
    /*
     MARK: 
     오토 로그인 로직은 로그인 뷰로 이관
     로그인뷰도 오토 로그인 x 수동 로그인
     */
    @Published var isAvailableToMoveLogin: Bool = false
    
    @MainActor
    init() {
        doTask()
    }
    
    @MainActor
    func doTask()  {
        Task {
            // 1초 타이머
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            self.isAvailableToMoveLogin = true
        }
    }
    
    deinit {
        print("deinit splash")
    }
}
