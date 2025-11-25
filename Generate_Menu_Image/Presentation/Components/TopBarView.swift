//
//  TopBarView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/25/25.
//

import SwiftUI

struct TopBarView: View {
    enum IconType {
        case close
        case back
        case none
        
        var image: String? {
            switch self {
            case .close:
                return "xmark"
            case .back:
                return "arrow.backward"
            case .none:
                return nil
            }
        }
    }
    
    var type: IconType
    var text: String
    var onTap: ()->()
    
    init(type: IconType = .none, text: String, onTap: @escaping () -> Void) {
        self.type = type
        self.text = text
        self.onTap = onTap
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .center) {
                if let systemName = type.image {
                    HStack(alignment: .center, spacing: 0, content: {
                        Image(systemName: systemName)
                            .font(.system(size: 16))
                            .padding()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                onTap()
                            }
                        Spacer()
                    })
                }
                Text(text)
                    .font(.gnbText)
                    .foregroundStyle(CustomColor.black)
            }
            .frame(height: 55)
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundStyle(CustomColor.line)
        }
        .frame(height: 56, alignment: .top)
        .background(Color.white)
    }
}

#Preview {
    TopBarView(text: "adsf") {
        
    }
}
