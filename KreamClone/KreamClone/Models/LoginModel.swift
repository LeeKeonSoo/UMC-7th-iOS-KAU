//
//  LoginModel.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.25.
//

import Foundation


struct Login {
    var email: String = ""
    var password: String = ""
}

struct KakaoLogin: Codable {
    let kakaoEmail: String
    let kakaoPassword: String
    
    enum CodingKeys: String, CodingKey {
        case kakaoEmail = "email"
        case kakaoPassword = "password"
    }
}

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    
    private let email: String = "userEmail"
    private let password: String = "userPassword"
    
    public func saveUserEmail(_ text: String) {
        userDefaults.set(text, forKey: email)
    }
    
    public func loadUserEmail() -> String? {
        return userDefaults.string(forKey: email)
    }
    
    public func saveUserPassword(_ text: String) {
        userDefaults.set(text, forKey: password)
    }
    
    public func loadUserPassword() -> String? {
        return userDefaults.string(forKey: password)
    }
    
}
