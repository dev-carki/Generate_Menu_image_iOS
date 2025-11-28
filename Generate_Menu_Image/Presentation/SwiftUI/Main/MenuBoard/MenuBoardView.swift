//
//  MenuBoardView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import SwiftUI

struct MenuBoardView: View {
    @StateObject private var coordinator: Coordinator = Coordinator()
    @StateObject private var viewModel = MenuBoardViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        NavigationView {
//            coordinator.navigationLinkSection()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    ForEach(viewModel.menuLists, id: \.id) { category in
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(category.categoryName)
                                .font(.title2)
                                .bold()
                            
                            if !category.categoryDesc.isEmpty {
                                Text(category.categoryDesc)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            // 메뉴 아이템들
                            ForEach(category.items, id: \.id) { item in
                                MenuItemRow(item: item)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getAllMenuList()
                print(viewModel.menuLists)
            }
        }
    }
}

struct MenuItemRow: View {
    let item: MenuListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.menuName)
                    .font(.headline)
                
                if !item.menuDesc.isEmpty {
                    Text(item.menuDesc)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Text("\(item.menuPrice)원")
                .font(.subheadline)
        }
        .padding(.vertical, 6)
    }
}


#Preview {
    MenuBoardView()
}
