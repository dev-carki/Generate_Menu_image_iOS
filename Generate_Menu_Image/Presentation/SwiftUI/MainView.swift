//
//  MainView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import SwiftUI

struct MainView: View {
    weak var navigation: CustomNavigationController?
    @StateObject private var viewModel = MainViewModel()
    
    
    var body: some View {
        VStack {
//            VStack(alignment: .leading) {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("프롬프트")
//                    TextField("", text: $viewModel.promptText)
//                        .textFieldStyle(.roundedBorder)
//                }
//                
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("스타일")
//                    TextField("", text: $viewModel.styleText)
//                        .textFieldStyle(.roundedBorder)
//                }
//                
//                Button(action: {
//                    Task {
//                        await viewModel.generateMenuBoard()
//                    }
//                }, label: {
//                    Text("API 호출")
//                })
//                .frame(maxWidth: .infinity)
//                .buttonStyle(BorderedButtonStyle())
//            }
//            .padding(.horizontal, 16)
//            
//            Divider()
//            
//            VStack(spacing: 12) {
//                Text("image id: \(viewModel.id)")
//                AsyncImage(url: URL(string: viewModel.image))
//                    .frame(height: 300)
//                Text("생성날자: \(viewModel.created_date)")
//            }
//            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    MainView()
}
