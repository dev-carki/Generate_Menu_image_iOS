//
//  MainViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import Foundation

import Factory

final class MainViewModel: ObservableObject {
    @Injected(\.appContext) var appContext
    @Published var storeName: String = ""
    @Published var storeID: Int = 1
    
    init() {
        self.storeName = self.appContext.storeName
        self.storeID = self.appContext.storeID
        
        print("[DEV-LOG] 스토어 아이디: \(self.storeID)\n 스토어 이름: \(self.storeName)")
    }
}
