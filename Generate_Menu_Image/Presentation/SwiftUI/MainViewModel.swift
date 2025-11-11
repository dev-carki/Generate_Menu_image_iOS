//
//  MainViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

import Factory

final class MainViewModel: ObservableObject {
    // MARK: API
    @Injected(\.generateMenuBoardUseCase) var generateMenuBoardUseCase
    @Published var promptText: String = ""
    @Published var styleText: String = ""
    
    
    // MARK: TEMP DATA
    @Published var id: String = ""
    @Published var image: String = ""
    @Published var created_date: String = ""
    
    func generateMenuBoard() async {
        let result = await self.generateMenuBoardUseCase.execute(GenerateMenuBoardRequestModel(prompt: promptText, style: styleText))
        
        DispatchQueue.main.async {
            switch result {
            case .success(let response):
                guard let response = response else {
                    return
                }
                
                print("DATA: ", response)
                self.id = response.id
                self.image = response.image
                self.created_date = response.created_date
                
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
}
