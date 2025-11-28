//
//  MainView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var coordinator: Coordinator = Coordinator()
    @StateObject private var viewModel = MainViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    coordinator.navigationLinkSection()
                    
                    topBar()
                    
                    ScrollView(showsIndicators: false) {
                        
                        HStack(spacing: 24) {
                            CustomButton(text: "메뉴판 생성하기") {
                                coordinator.push(destination: .createMenuBoard)
                            }
                            
                            CustomButton(text: "메뉴판 조회하기") {
                                coordinator.push(destination: .showMenuBoard)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    private func topBar() -> some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 12) {
                Image("logo")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Text($viewModel.storeName.wrappedValue)
                    .font(.titleMenu)
                    .foregroundColor(CustomColor.black)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .padding(.horizontal, 16)
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundStyle(CustomColor.line)
        }
        .frame(height: 56, alignment: .top)
        .background(Color.white)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    MainView()
}
