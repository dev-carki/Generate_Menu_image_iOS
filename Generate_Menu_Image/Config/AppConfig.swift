//
//  AppConfig.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation


enum AppConfig {
    static var apiBaseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("API_BASE_URL is not set in Info.plist")
        }
        // %를 //로 치환
        let fixedURL = url.replacingOccurrences(of: "%", with: "//")
        return fixedURL
    }
}
