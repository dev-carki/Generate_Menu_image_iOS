//
//  CustomProgressView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/25/25.
//

import SwiftUI

struct CustomProgressView: View {
    let title: String
    
    var body: some View {
        ZStack {
            CustomColor.gray500.opacity(0.5)
            
            VStack(alignment: .center, spacing: 24) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                
                Text(title)
                    .font(.title)
                    .foregroundStyle(.white)
            }
            .padding(.all, 20)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(CustomColor.gray600)
            )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CustomProgressView(title: "제목")
}
