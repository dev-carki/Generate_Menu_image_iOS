//
//  TimeValidation.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import Foundation

struct TimeValidation {
    static func validateHour(_ hour: String?) -> Bool {
        guard let hour = hour, let intHour = Int(hour) else { return false }
        return intHour >= 0 && intHour <= 24
    }
    
    static func validateMinute(_ min: String?) -> Bool {
        guard let min = min, let intMin = Int(min) else { return false }
        return intMin >= 0 && intMin <= 60
    }
}

