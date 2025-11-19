//
//  String+Extension.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

extension String {
    func toKorDate() -> Date? {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm"
        
        return formatter.date(from: self)
    }
}
