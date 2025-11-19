//
//  CodeItNetworkService.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/11/25.
//

import Foundation
import Alamofire
import Factory

class CodeItNetworkService: BaseNetworkservice {
    
    private func afErrorConverter(_ afError: AFError) -> MenuBoardNetworkError {
        return MenuBoardNetworkError.AFERROR
    }
    
    private func decodeError(_ apiError: ApiError) -> MenuBoardNetworkError {
        switch apiError {
        case .customError(let data):
            if let failResponse: MenuBoardErrorResponse = try? JSONDecoder().decode(MenuBoardErrorResponse.self, from: data) {
                return MenuBoardNetworkError(rawValue: failResponse.code) ?? MenuBoardNetworkError.AFERROR
            }
            return MenuBoardNetworkError.AFERROR
        default:
            return MenuBoardNetworkError.AFERROR
        }
    }
    
    func get<T>(_ host: String, url: String, auth: Bool = false, parameters: Parameters? = nil) async -> Result<T, MenuBoardNetworkError> where T: Codable {
        var headers: [String: String] = [:]
        
        return await request(host, url: url, auth: auth, method: .get, headers: headers, parameters: parameters, httpBody: nil).mapError { apiError in
            self.decodeError(apiError)
        }
    }
    
    func post<T>(_ host: String, url: String, auth: Bool = false, parameters: Parameters? = nil, httpBody: Any? = nil) async -> Result<T, MenuBoardNetworkError> where T: Codable {
        var headers: [String: String] = [:]
        
        // MARK: Header Param 필요시
//        if auth, !userDefaultsManager.accessToken.isEmpty {
//            headers["Authorization"] = "Bearer \(userDefaultsManager.accessToken)"
//        }
        
        return await request(host, url: url, auth: auth, method: .post, headers: headers, parameters: parameters, httpBody: httpBody).mapError {
            return self.decodeError($0)
        }
    }
    
    func patch<T>(_ host: String, url: String, auth: Bool = false, parameters: Parameters? = nil, httpBody: Any? = nil) async -> Result<T, MenuBoardNetworkError> where T: Codable {
        var headers: [String: String] = [:]
//        if auth, !userDefaultsManager.accessToken.isEmpty {
//            headers["Authorization"] = "Bearer \(userDefaultsManager.accessToken)"
//        }
        
        return await request(host, url: url, auth: auth, method: .patch, headers: headers, parameters: parameters, httpBody: httpBody).mapError { apiError in
            self.decodeError(apiError)
        }
    }
    
    func upload<T>(_ host: String, url: String, auth: Bool = false, body: MultipartFormData) async -> Result<T, MenuBoardNetworkError> where T: Codable {
        var headers: [String: String] = [:]
//        if auth, !userDefaultsManager.accessToken.isEmpty {
//            headers["Authorization"] = "Bearer \(userDefaultsManager.accessToken)"
//        }
        print("headers: \(headers)")
        return await uploadFormData(host, url: url, auth: auth, method: .post, headers: headers, body: body).mapError { apiError in
            self.decodeError(apiError)
        }
    }
}
