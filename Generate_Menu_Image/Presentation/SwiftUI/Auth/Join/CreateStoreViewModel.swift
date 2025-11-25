//
//  CreateStoreViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

import Factory

final class CreateStoreViewModel: ObservableObject {
    // MARK: API
    @Injected(\.createStoreUseCase) var createStoreUseCase
    
    // MARK: Input Data
    @Published var storeName: String = ""
    @Published var storeAddress: String = ""
    @Published var storePhoneNumber: String = ""
    @Published var storeOpenHour: String?
    @Published var storeOpenMin: String?
    @Published var storeCloseHour: String?
    @Published var storeCloseMin: String?
    
    @Published var openTimeErrorMessage: String?
    @Published var closeTimeErrorMessage: String?
    
    @Published var isCreateSuccess: Bool = false
    @Published var id_text: String = ""
    
    func createStore() async {
//        // 검증
//        guard await MainActor.run(body: { validateTimes() }) else { return }
//        
//        // HH:mm 문자열 생성
//        let openTimeStr = String(format: "%02d:%02d",
//                                 Int(storeOpenHour!)!,
//                                 Int(storeOpenMin!)!)
//        let closeTimeStr = String(format: "%02d:%02d",
//                                  Int(storeCloseHour!)!,
//                                  Int(storeCloseMin!)!)
//        
//        // Date 변환
//        guard let openTimeDate = openTimeStr.toKorDate(),
//              let closeTimeDate = closeTimeStr.toKorDate() else {
//            if openTimeStr.toKorDate() == nil { openTimeErrorMessage = "오픈 시간 입력이 올바르지 않습니다." }
//            if closeTimeStr.toKorDate() == nil { closeTimeErrorMessage = "마감 시간 입력이 올바르지 않습니다" }
//            return
//        }
        
        let result = await self.createStoreUseCase.execute(
            CreateStoreRequestModel(
                name: self.storeName,
                address: self.storeAddress,
                phone: self.storePhoneNumber,
                open_time: "09:00",
                close_time: "21:00"
            )
        )
        
        DispatchQueue.main.async {
            switch result {
            case .success(let response):
                self.isCreateSuccess = true
                self.id_text = String(response.id)
            case .failure(let error):
                self.isCreateSuccess = false
                self.id_text = ""
            }
        }
        
    }
    
    @MainActor
    private func validateTimes() -> Bool {
        var isValid = true
        openTimeErrorMessage = nil
        closeTimeErrorMessage = nil
        
        // 오픈 시간
        if !TimeValidation.validateHour(storeOpenHour) {
            openTimeErrorMessage = "오픈 시간(hour)이 올바르지 않습니다. 0~24 사이 입력하세요."
            isValid = false
        }
        if !TimeValidation.validateMinute(storeOpenMin) {
            openTimeErrorMessage = (openTimeErrorMessage ?? "") + " 오픈 분(minute)이 올바르지 않습니다. 0~60 사이 입력하세요."
            isValid = false
        }
        
        // 마감 시간
        if !TimeValidation.validateHour(storeCloseHour) {
            closeTimeErrorMessage = "마감 시간(hour)이 올바르지 않습니다. 0~24 사이 입력하세요."
            isValid = false
        }
        if !TimeValidation.validateMinute(storeCloseMin) {
            closeTimeErrorMessage = (closeTimeErrorMessage ?? "") + " 마감 분(minute)이 올바르지 않습니다. 0~60 사이 입력하세요."
            isValid = false
        }
        
        return isValid
    }
}
