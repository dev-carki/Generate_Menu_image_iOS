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
    
    init() {
        self.storeName = self.appContext.storeName
    }
}
