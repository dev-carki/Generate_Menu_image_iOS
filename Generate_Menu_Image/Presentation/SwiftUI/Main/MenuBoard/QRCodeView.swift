//
//  QRCodeView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 12/2/25.
//

import SwiftUI

struct QRCodeView: View {
    @StateObject private var viewModel = QRCodeViewModel()
    @State var url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(CustomColor.darkgray)
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height / 2)
                .overlay(
                    VStack(spacing: 16) {
                        Image(uiImage: viewModel.generateQRCode(from: url))
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.all, 40)
                            .ignoresSafeArea()
                    }
                )
        }
    }
}

#Preview {
    QRCodeView(url: "https://www.naver.com")
}

