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
        onConfirm: @escaping () -> (),
        onClose: @escaping () -> ()
    ) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(content: {
            if isPresented.wrappedValue {
                ZStack(content: {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isPresented.wrappedValue = false
                            onClose()
                        }

                    CustomDialogView(title: title, content: content, alignment: alignment) {
                        isPresented.wrappedValue = false
                        onConfirm()
                    } onClose: {
                        isPresented.wrappedValue = false
                        onClose()
                    }
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
    var onClose: () -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: alignment.horizontalAlignment, spacing: 0, content: {
                HStack(alignment: .center, spacing: 0, content: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                        .padding(8)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            onClose()
                        }
                    Spacer()
                })
                Text(title)
                    .font(.title)
                    .foregroundStyle(CustomColor.black)
                    .multilineTextAlignment(alignment.textAlignment)
                    .padding(.top, 44)
                Text(content)
                    .font(.sub)
                    .foregroundStyle(CustomColor.gray700)
                    .multilineTextAlignment(alignment.textAlignment)
                    .padding(.top, 10)
                
                CustomButton(text: "확인") {
                    onConfirm()
                }
                .padding(.top, 44)
            })
            .padding(20)
        })
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.white)
        )
        .padding(.horizontal, 40)
    }
}


#Preview {
    CustomDialogView(title: "", content: "", alignment: .center) {
        
    } onClose: {
        
    }
}
