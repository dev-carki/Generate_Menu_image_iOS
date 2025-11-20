//
//  LoginView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject var coordinator = Coordinator()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            CustomNormalTextField(
                titleText: "가게 ID 입력",
                placeHolderText: "발급받은 ID를 입력해주세요.",
                inputText: $viewModel.loginID,
                isError: $viewModel.isLoginSuccess,
                errorText: $viewModel.loginErrorText,
                keyboardType: .numberPad,
                type: .normal
            )
            
            CustomButton(text: "로그인") {
                UIApplication.shared.hideKeyboard()
                
                Task {
                    await viewModel.login()
                }
            }
        }
        .padding(.horizontal, 16)
        .onChange(of: $viewModel.isLoginSuccess.wrappedValue, perform: { value in
            if value {
                coordinator.moveToMain()
            }
        })
    }
}

#Preview {
    LoginView()
}
