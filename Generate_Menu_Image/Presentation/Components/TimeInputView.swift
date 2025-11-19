//
//  TimeInputView.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

struct TimeInputView: View {
    let title: String
    @Binding var hour: String?
    @Binding var minute: String?
    let hourErrorMessage: String?
    let minuteErrorMessage: String?
    
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case hour
        case minute
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Title
            Text(title)
                .foregroundColor(.gray)
                .font(.headline)
            
            HStack(spacing: 8) {
                // Hour TextField
                VStack(spacing: 0) {
                    TextField("", text: Binding($hour, default: ""))
                        .placeholder(when: Binding($hour, default: "").wrappedValue.isEmpty) {
                            Text("HH")
                                .foregroundColor(.gray)
                                .font(.body)
                        }
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                        .padding(8)
                        .background(hourErrorMessage != nil ? Color.red.opacity(0.1) : Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .focused($focusedField, equals: .hour)
                    
                    if let hourErrorMessage = hourErrorMessage {
                        Text(hourErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption2)
                    }
                }
                
                Text(":")
                
                // Minute TextField
                VStack(spacing: 0) {
                    TextField("", text: Binding($minute, default: ""))
                        .placeholder(when: Binding($minute, default: "").wrappedValue.isEmpty) {
                            Text("MM")
                                .foregroundColor(.gray)
                                .font(.body)
                        }
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                        .padding(8)
                        .background(minuteErrorMessage != nil ? Color.red.opacity(0.1) : Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .focused($focusedField, equals: .minute)
                    
                    if let minuteErrorMessage = minuteErrorMessage {
                        Text(minuteErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption2)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

extension Binding where Value == String {
    init(_ source: Binding<String?>, default defaultValue: String = "") {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}



#Preview {
    TimeInputView(title: "오픈 시간", hour: .constant("12"), minute: .constant("00"), hourErrorMessage: "에러", minuteErrorMessage: "에러")
}
