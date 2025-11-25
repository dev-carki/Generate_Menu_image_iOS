//
//  CustomNormalTextField.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//
import SwiftUI

struct CustomNormalTextField: View {
    @FocusState private var textFieldFocused: Bool
    
    let titleText: String?
    let limit: Int?
    let placeHolderText: String?
    @Binding var inputText: String
    var isError: Binding<Bool>
    let errorText: Binding<String>
    var isConfirm: Binding<Bool>?
    let confirmText: Binding<String>?
    let keyboardType: UIKeyboardType
    let type: CustomTextFieldType
    
    @FocusState private var isFocused: Bool
    
    init(
        titleText: String? = nil,
        limit: Int? = nil,
        placeHolderText: String? = nil,
        inputText: Binding<String>,
        isError: Binding<Bool>,
        errorText: Binding<String>,
        isConfirm: Binding<Bool>? = nil,
        confirmText: Binding<String>? = nil,
        keyboardType: UIKeyboardType,
        type: CustomTextFieldType
    ) {
        self.titleText = titleText
        self.limit = limit
        self.placeHolderText = placeHolderText
        self._inputText = inputText
        self.isError = isError
        self.errorText = errorText
        self.isConfirm = isConfirm
        self.confirmText = confirmText
        self.keyboardType = keyboardType
        self.type = type
    }
    
    var body: some View {
        VStack(spacing: 4) {
            titleArea()
            
            switch type {
            case .normal:
                normalTextFieldArea()
            case .xMark:
                xMarkTextFieldArea()
            }
            
            errorArea()
        }
        .onChange(of: $inputText.wrappedValue, perform: { newValue in
            if let limit = limit, newValue.count > limit {
                $inputText.wrappedValue = String(newValue.prefix(limit))
            }
        })
    }
    
    @ViewBuilder
    private func titleArea() -> some View {
        if let title = titleText {
            Text(title)
                .foregroundColor(CustomColor.darkgray)
                .font(.inputTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func normalTextFieldArea() -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 8) {
                TextField("", text: $inputText)
                    .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                        Text(placeHolderText ?? "")
                            .foregroundColor(CustomColor.gray400)
                            .font(.inputbox)
                    })
                    .autocapitalization(.none) // 대문자로 시작 방지
                    .foregroundColor(CustomColor.darkgray)
                    .font(.inputbox)
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled()
                    .focused($textFieldFocused)
                    .toolbar {
                        ToolbarItemGroup (placement: .keyboard) {
                            // 패턴 매칭을 사용하여 focusedField가 특정 텍스트 필드 인덱스와 같은지 확인
                            if textFieldFocused {
                                Spacer()
                                Button(action: {
                                    UIApplication.shared.hideKeyboard()
                                }, label: {
                                    Image("keyboard.chevron.compact.down.fill")
                                        .resizable()
                                        .scaledToFit()
                                })
                            }
                        }
                    }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(isError.wrappedValue ? CustomColor.fail : CustomColor.underStroke)
            .cornerRadius(8)
            
            //MARK: [Todo - Color]
//            Rectangle()
//                .foregroundColor(isError.wrappedValue ? .fail : .underStroke)
//                .frame(height: 1)
        }
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
    }
    
    @ViewBuilder
    private func xMarkTextFieldArea() -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 4) {
                TextField("", text: $inputText)
                    .placeholder(when: $inputText.wrappedValue.isEmpty, placeholder: {
                        Text(placeHolderText ?? "")
                            .foregroundColor(CustomColor.gray400)
                            .font(.inputbox)
                    })
                    .autocapitalization(.none) // 대문자로 시작 방지
                    .foregroundColor(CustomColor.darkgray)
                    .font(.inputbox)
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled()
                    .focused($textFieldFocused)
                    .toolbar {
                        ToolbarItemGroup (placement: .keyboard) {
                            // 패턴 매칭을 사용하여 focusedField가 특정 텍스트 필드 인덱스와 같은지 확인
                            if textFieldFocused {
                                Spacer()
                                Button(action: {
                                    UIApplication.shared.hideKeyboard()
                                }, label: {
                                    Image("keyboard.chevron.compact.down.fill")
                                        .resizable()
                                        .scaledToFit()
                                })
                            }
                        }
                    }
                
                Image("xmark.circle.fill")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .onTapGesture {
                        $inputText.wrappedValue = ""
                    }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)

            
            //MARK: [Todo - Color]
            Rectangle()
                .foregroundColor(isError.wrappedValue ? CustomColor.fail : CustomColor.underStroke)
                .frame(height: 1)
        }
        .frame(maxWidth: .infinity, alignment: .bottomLeading)
    }
    
    @ViewBuilder
    private func errorArea() -> some View {
        switch type {
        case .normal:
            VStack {
                if isError.wrappedValue {
                    Text(errorText.wrappedValue)
                        .font(.inputError)
                        .foregroundColor(CustomColor.fail)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(height: 14)
            .frame(maxWidth: .infinity, alignment: .leading)
        default:
            VStack {
                if isError.wrappedValue {
                    Text(errorText.wrappedValue)
                        .font(.inputError)
                        .foregroundColor(CustomColor.fail)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else if let isConfirm = isConfirm, let confirmText = confirmText, isConfirm.wrappedValue {
                    Text(confirmText.wrappedValue)
                        .font(.inputError)
                        .foregroundColor(CustomColor.success)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(height: 14)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        CustomNormalTextField(
            titleText: "아이디",
            placeHolderText: "아이디를 입력해주세요.",
            inputText: .constant(""),
            isError: .constant(true),
            errorText: .constant("asdfasdf"),
            keyboardType: .default,
            type: .normal
        )
        .padding(.horizontal, 16)
    }
}
