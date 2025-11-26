//
//  MainView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var coordinator: Coordinator = Coordinator()
    @StateObject private var viewModel = MainViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        NavigationView {
            coordinator.navigationLinkSection()
            
            VStack {
                Text("메인뷰")
            }
        }
    }
}

#Preview {
    MainView()
}
