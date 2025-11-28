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
        alignment: CustomDialogAlignment = .leading,
        onConfirm: @escaping () -> (),
        onCancel: (() -> Void)? = nil
    ) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(content: {
                if isPresented.wrappedValue {
                    ZStack {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                            .onTapGesture {
                                // Dim 클릭 시 취소 처리 가능
                                onCancel?()
                                isPresented.wrappedValue = false
                            }
                        
                        CustomDialogView(
                            title: title,
                            content: content,
                            alignment: alignment,
                            onConfirm: {
                                isPresented.wrappedValue = false
                                onConfirm()
                            },
                            onCancel: {
                                isPresented.wrappedValue = false
                                onCancel?()
                            }
                        )
                        .padding(.horizontal, 16)
                        .ignoresSafeArea(.keyboard)
                    }
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
    var onCancel: (() -> Void)? = nil  // 옵션
    
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
            
            // MARK: 버튼 영역
            HStack(spacing: 12) {
                if let onCancel = onCancel {
                    Button(action: {
                        onCancel()
                    }) {
                        Text("취소")
                            .font(.button)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(CustomColor.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
                Button(action: {
                    onConfirm()
                }) {
                    Text("확인")
                        .font(.button)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(CustomColor.fail)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
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
