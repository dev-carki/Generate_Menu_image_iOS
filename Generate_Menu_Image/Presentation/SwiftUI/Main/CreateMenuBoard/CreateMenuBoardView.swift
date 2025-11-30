//
//  CreateMenuBoardView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import SwiftUI

struct CreateMenuBoardView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = CreateMenuBoardViewModel()
    @StateObject var coordinator = Coordinator()
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    TopBarView(
                        type: .back,
                        text: "메뉴판 생성",
                        onTap: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        rightIconName: "plus",
                        onRightTap: {
                            coordinator.push(destination: .addMenuItem(
                                onComplete: { newItem in
                                    viewModel.menuItems.append(newItem)
                                }
                            ))
                        }
                    )
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            ForEach(viewModel.menuItems) { category in
                                MenuCardView(category: category) {
                                    // 삭제 버튼 클릭
                                    viewModel.categoryToDelete = category
                                    viewModel.isDelete = true
                                } onEdit: {
                                    // 수정 버튼 클릭
                                    coordinator.push(destination: .addMenuItem(
                                        categoryToEdit: category,
                                        onComplete: { updatedCategory in
                                            if let idx = viewModel.menuItems.firstIndex(where: { $0.id == category.id }) {
                                                viewModel.menuItems[idx] = updatedCategory
                                            }
                                        }
                                    ))
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    CustomButton(text: "생성하기") {
                        print(viewModel.menuItems)
                        Task {
                            await viewModel.createMenuBoard()
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .customDialog(isPresented: $viewModel.isCreateSuccess, title: "메뉴판 생성 요청 성공", content: "AI가 메뉴판을 구성중입니다.", alignment: .center) {
                self.presentationMode.wrappedValue.dismiss()
            }
            .customDialog(isPresented: $viewModel.isDelete, title: "카테고리 삭제", content: "확인 버튼을 누르면 해당 카테고리를 삭제합니다", alignment: .center, onConfirm: {
                if let category = viewModel.categoryToDelete,
                   let idx = viewModel.menuItems.firstIndex(where: { $0.id == category.id }) {
                    viewModel.menuItems.remove(at: idx)
                }
                viewModel.categoryToDelete = nil
                viewModel.isDelete = false
            }, onCancel: {
                viewModel.categoryToDelete = nil
                viewModel.isDelete = false
            })
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CreateMenuBoardView()
}
