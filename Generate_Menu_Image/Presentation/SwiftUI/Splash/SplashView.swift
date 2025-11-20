//
//  SplashView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = SplashViewModel()
    @StateObject private var coordinator: Coordinator = Coordinator()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundGreen
                Image("Splash_Image")
                    .resizable()
                    .scaledToFit()
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onChange(of: $viewModel.isAvailableToMoveLogin.wrappedValue, perform: { value in
            coordinator.moveToLogin()
        })
    }
}

#Preview {
    SplashView()
}
