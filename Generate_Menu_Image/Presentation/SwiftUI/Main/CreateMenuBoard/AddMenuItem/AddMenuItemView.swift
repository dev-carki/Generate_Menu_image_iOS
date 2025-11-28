//
//  AddMenuItemView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import SwiftUI
struct AddMenuItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var coordinator = Coordinator()
    
    // 카테고리 & 메뉴 입력 상태
    @State private var categoryName: String = ""
    @State private var items: [MenuItem] = [MenuItem()]
    
    let onComplete: (MenuCategory) -> Void
    
    init(categoryToEdit: MenuCategory? = nil, onComplete: @escaping (MenuCategory) -> Void) {
        self._categoryName = State(initialValue: categoryToEdit?.categoryName ?? "")
        self._items = State(initialValue: categoryToEdit?.items ?? [MenuItem()])
        self.onComplete = onComplete
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                coordinator.navigationLinkSection()
                
                TopBarView(
                    type: .back,
                    text: "카테고리 추가",
                    onTap: { self.presentationMode.wrappedValue.dismiss() },
                    rightText: "완료",
                    onRightTextTap: saveCategory
                )
                
                Form {
                    // MARK: - 카테고리 섹션
                    Section(header: Text("카테고리 이름")
                        .font(.titleMenu)) {
                            TextField("예: 커피", text: $categoryName)
                                .submitLabel(.done)
                        }
                    
                    // MARK: - 메뉴 항목 섹션
                    Section(
                        header:
                            HStack {
                                Text("메뉴 항목")
                                    .font(.titleMenu)
                                Spacer()
                                Button(action: addNewEmptyItem) {
                                    Label("추가", systemImage: "plus.circle.fill")
                                        .labelStyle(.iconOnly)
                                }
                            }
                    ) {
                        ForEach($items) { $item in
                            VStack(spacing: 6) {
                                TextField("메뉴명 (예: 아메리카노)", text: $item.name)
                                    .submitLabel(.next)
                                
                                Rectangle()
                                    .frame(height: 1)
                                
                                TextField("가격 (예: 4500)", text: $item.price)
                                    .keyboardType(.numberPad)
                            }
                            .padding(.vertical, 6)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    
                    // MARK: - 설명 Section (UX 보조)
                    if items.count > 1 {
                        Section {
                            Text("항목을 왼쪽으로 스와이프하면 삭제할 수 있어요.")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Actions
    
    private func addNewEmptyItem() {
        items.append(MenuItem())
    }
    
    private func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    private func saveCategory() {
        let cleanedItems = items.filter { !$0.name.isEmpty }
        
        guard !categoryName.trimmingCharacters(in: .whitespaces).isEmpty,
              !cleanedItems.isEmpty else { return }
        
        let newCategory = MenuCategory(
            categoryName: categoryName,
            items: cleanedItems
        )
        
        onComplete(newCategory)
        presentationMode.wrappedValue.dismiss()
    }
    
    private func canSave() -> Bool {
        !categoryName.trimmingCharacters(in: .whitespaces).isEmpty &&
        items.contains { !$0.name.trimmingCharacters(in: .whitespaces).isEmpty }
    }
}


#Preview {
    AddMenuItemView() { item in
        
    }
}
