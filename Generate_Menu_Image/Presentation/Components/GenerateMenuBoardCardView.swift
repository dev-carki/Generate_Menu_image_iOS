//
//  GenerateMenuBoardCardView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/14/25.
//
import SwiftUI
import PhotosUI

struct GenerateMenuBoardCardView: View {
    @Binding var menuName: String
    @Binding var menuPrice: String
    @Binding var menuImage: UIImage?

    @State private var photoItem: PhotosPickerItem? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // 메뉴 이름
            VStack(alignment: .leading, spacing: 8) {
                Text("메뉴 이름")
                    .font(.headline)
                TextField("예: 짬뽕", text: $menuName)
                    .textFieldStyle(.roundedBorder)
            }

            // 메뉴 가격
            VStack(alignment: .leading, spacing: 8) {
                Text("메뉴 가격")
                    .font(.headline)
                TextField("예: 10000원", text: $menuPrice)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }

            // 이미지 업로드
            VStack(alignment: .leading, spacing: 8) {
                Text("메뉴 이미지 첨부")
                    .font(.headline)

                PhotosPicker(
                    selection: $photoItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    HStack {
                        Image(systemName: "photo.on.rectangle")
                        Text("이미지 선택하기")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .onChange(of: photoItem) { newItem in
                    Task {
                        guard let newItem else { return }
                        do {
                            if let data = try await newItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                await MainActor.run {
                                    print("선택된 이미지: ", uiImage)
                                    self.menuImage = uiImage
                                }
                            } else {
                                print("이미지 데이터 로딩 실패")
                            }
                        } catch {
                            print("이미지 로딩 에러:", error)
                        }
                    }
                }
            }
            
            // 선택한 이미지 미리보기
            if let image = menuImage {
                ImageThumbnailView(image: image, size: 80)
            }
        }
        .padding(16)
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(16)
        .padding(.horizontal, 16)
    }
}

struct ImageThumbnailView: View {
    let image: UIImage
    let size: CGFloat
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .cornerRadius(8)
            .shadow(radius: 2)
    }
}


#Preview {
    GenerateMenuBoardCardView(
        menuName: .constant(""),
        menuPrice: .constant(""),
        menuImage: .constant(nil)
    )
}
