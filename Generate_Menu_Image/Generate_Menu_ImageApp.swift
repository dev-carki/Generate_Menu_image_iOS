//
//  Generate_Menu_ImageApp.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import SwiftUI

@main
struct Generate_Menu_ImageApp: App {
    @StateObject var coordinator = Coordinator(isRoot: true)
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
                    Color.white
                    coordinator.navigationLinkSection()
                    
                    switch coordinator.rootState {
                    case .home:
                        MainView()
                            .onAppear {
                                print("[SD] appear home view")
                            }
                    case .login:
                        LoginView()
                            .onAppear {
                                print("[SD] appear login view")
                            }
                    case .splash:
                        SplashView()
                            .onAppear {
                                print("[SD] appear splash view")
                            }
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden()
            }
            .navigationViewStyle(.stack)
        }
    }
}
