//
//  AppConfig.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation

enum AppConfig {
    static var apiBaseURL: String {
        Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String
        ?? "http://localhost:8080"  // 기본값 (fallback)
    }
}
