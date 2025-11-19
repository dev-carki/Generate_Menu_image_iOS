//
//  Date+Extensions.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

extension Date {
    func toKorTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: self)
    }
}
