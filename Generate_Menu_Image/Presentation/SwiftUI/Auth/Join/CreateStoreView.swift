//
//  CreateStoreView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

struct CreateStoreView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = CreateStoreViewModel()
    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                coordinator.navigationLinkSection()
                
                TopBarView(type: .back, text: "스토어 생성") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding(.horizontal, -16)
                
                CustomNormalTextField(
                    titleText: "가게 이름",
                    placeHolderText: "가게 이름을 입력해주세요.",
                    inputText: $viewModel.storeName,
                    isError: .constant(false),
                    errorText: .constant(""),
                    keyboardType: .default,
                    type: .normal
                )
                
                CustomNormalTextField(
                    titleText: "가게 주소",
                    placeHolderText: "가게 주소를 입력해주세요.",
                    inputText: $viewModel.storeAddress,
                    isError: .constant(false),
                    errorText: .constant(""),
                    keyboardType: .default,
                    type: .normal
                )
                
                CustomNormalTextField(
                    titleText: "연락처",
                    placeHolderText: "연락처를 입력해주세요.",
                    inputText: $viewModel.storePhoneNumber,
                    isError: .constant(false),
                    errorText: .constant(""),
                    keyboardType: .numberPad,
                    type: .normal
                )
                
                Spacer()
                
                CustomButton(type: .middle, text: "작성 완료") {
                    Task {
                        await viewModel.createStore()
                    }
                }
            }
            .padding(.horizontal, 16)
            .onAppear(perform: {
                print("API_BASE_URL:", AppConfig.apiBaseURL)
            })
            .customDialog(isPresented: $viewModel.isCreateSuccess, title: "ID가 생성되었습니다.", content: "ID: \(viewModel.id_text)") {
                self.presentationMode.wrappedValue.dismiss()
            } onClose: {
                self.presentationMode.wrappedValue.dismiss()
            }

        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CreateStoreView()
}
