//
//  MenuCardView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import SwiftUI

struct MenuCardView: View {
    let category: MenuCategory
    let onDelete: () -> Void
    let onEdit: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // MARK: - Category Section
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(category.categoryName)
                        .foregroundColor(CustomColor.black)
                        .font(.titleMenu)

                    Spacer()

                    Text("\(category.items.count) 개")
                        .foregroundColor(CustomColor.gray300)
                        .font(.button)
                }

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(CustomColor.gray200)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 12) {
                        ForEach(category.items.indexedArray, id: \.element.id) { index, item in
                            menuListCard(
                                menuName: item.name,
                                menuPrice: item.price,
                                menuIndex: index
                            )
                        }
                    }
                    .padding(.all, 4)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)

            Divider()

            // MARK: - Bottom Action Buttons
            HStack(spacing: 0) {
                Button(action: onDelete) {
                    Text("삭제하기")
                        .font(.button)
                        .foregroundColor(CustomColor.fail)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                }
                .cornerRadius(16, corners: [.bottomLeft])
                
                Rectangle()
                    .frame(width: 1)
                    .foregroundColor(CustomColor.gray300)

                Button(action: onEdit) {
                    Text("수정하기")
                        .font(.button)
                        .foregroundColor(CustomColor.success)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                }
                .cornerRadius(16, corners: [.bottomRight])
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.vertical, 4)
    }

    @ViewBuilder
    private func menuListCard(menuName: String, menuPrice: String, menuIndex: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("메뉴 \(menuIndex + 1)")
                .font(.button)
                .foregroundColor(CustomColor.gray300)

            Text(menuName)
                .font(.titleMenu)
                .foregroundColor(CustomColor.black)

            Text(menuPrice + "원")
                .font(.body)
                .foregroundColor(CustomColor.black)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
        )
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
        .shadow(color: .black.opacity(0.03), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    MenuCardView(
        category: MenuCategory(
            categoryName: "파스타",
            items: [
                MenuItem(name: "로제 파스타", price: "10000"),
                MenuItem(name: "기름 파스타", price: "10000"),
                MenuItem(name: "낭쿠 파스타", price: "10000"),
                MenuItem(name: "이린 파스타", price: "10000")
            ]
        ),
        onDelete: {},
        onEdit: {}
    )
}
