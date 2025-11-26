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
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    coordinator.navigationLinkSection()
                    
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.all, 24)
                    }
                    .frame(width: 300, height: 300)
                    .frame(maxWidth: .infinity)
                    
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
                    
                    HStack {
                        line
                        Text("or")
                            .foregroundColor(.gray)
                            .font(.gnbText)
                        line
                    }
                    
                    HStack(alignment: .center, spacing: 24) {
                        Image("kakao")
                            .resizable()
                            .scaledToFit()
                        Image("naver")
                            .resizable()
                            .scaledToFit()
                        Image("apple")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 16)
                
                VStack {
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 12) {
                        Text("ID가 없으신가요?")
                            .foregroundColor(CustomColor.green)
                            .font(.caption)
                        
                        Text("ID 생성하기")
                            .foregroundColor(CustomColor.gray500)
                            .font(.caption)
                            .padding(.bottom, 0) // 텍스트와 밑줄 사이 간격
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .foregroundColor(CustomColor.gray500)
                                    .frame(height: 1)
                                    .offset(y: 4) // 살짝 아래로 이동 (선과 텍스트 거리 조절)
                            }
                            .onTapGesture {
                                print("tap")
                                coordinator.push(destination: .join)
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                if viewModel.isLoginTrying {
                    CustomProgressView(title: "로그인중")
                }
            }
            .onChange(of: $viewModel.isLoginSuccess.wrappedValue, perform: { value in
                if value {
                    withAnimation {
                        coordinator.moveToMain()
                    }
                }
            })
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
    private var line: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(CustomColor.gray300)
    }
}

#Preview {
    LoginView()
}
