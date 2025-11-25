//
//  CustomDialogView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/25/25.
//

import SwiftUI

import SwiftUI

public enum CustomDialogAlignment {
    case leading
    case center
    
    var textAlignment: TextAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        }
    }
    
    var horizontalAlignment: HorizontalAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        }
    }
}
extension View {
    /// TRK용 팝업창
    /// - Parameters:
    ///   - isPresented: Binding 변수로 true이면 팝업이 뜸
    ///   - title: 제목
    ///   - content: 내용
    ///   - textAlignment: text 정렬 (default: .leading)
    ///   - onConfirm: 확인 버튼 클릭시 창 닫히며 onConfirm 클로저 호출
    ///   - onClose: X 버튼 및 dim 공간 클릭시 창 닫히며 onClose 클로저 호출
    ///
    ///
    /// **[사용법]**
    ///```code
    /// .trkDialog(
    ///     isPresented: $isPresented,
    ///     title: "제목입니다~",
    ///     content: "내용입니다~") {
    ///         print("확인 클릭")
    ///     } onClose: {
    ///         print("닫기 클릭")
    ///     }
    /// )
    /// ```
    
    public func customDialog(
        isPresented: Binding<Bool>,
        title: String,
        content: String,
        alignment: CustomDialogAlignment = CustomDialogAlignment.leading,
        onConfirm: @escaping () -> ()
    ) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(content: {
            if isPresented.wrappedValue {
                ZStack(content: {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()

                    CustomDialogView(title: title, content: content, alignment: alignment) {
                        isPresented.wrappedValue = false
                        onConfirm()
                    }
                    .padding(.horizontal, 16)
                    .ignoresSafeArea(.keyboard)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        })
    }
    

    public func customDialog<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(content: {
            if isPresented.wrappedValue {
                ZStack(content: {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    content()
                        .ignoresSafeArea(.keyboard)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        })
    }
}

struct CustomDialogView: View {
    var title: String
    var content: String
    var alignment: CustomDialogAlignment
    var onConfirm: () -> ()
    
    var body: some View {
        VStack(alignment: alignment.horizontalAlignment, spacing: 24) {
            Text(title)
                .font(.title)
                .foregroundStyle(CustomColor.black)
                .multilineTextAlignment(alignment.textAlignment)
            
            Text(content)
                .font(.sub)
                .foregroundStyle(CustomColor.gray700)
                .multilineTextAlignment(alignment.textAlignment)
            
            
            CustomButton(text: "확인") {
                onConfirm()
            }
            .padding(.top, 20)
        }
        .padding(.all, 20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.white)
        )
    }
}


#Preview {
    CustomDialogView(title: "", content: "", alignment: .center) {
        
    }
}
