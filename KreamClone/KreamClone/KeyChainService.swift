//
//  KeyChainService.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.16.
//

import Foundation
import Security

class KeychainService {
    static let shared = KeychainService()
    
    private init() {}
    
    func saveToken(_ token: String, forKey key: String) {
        // 토큰을 Data로 변환
        guard let tokenData = token.data(using: .utf8) else { return }
        
        // 키체인 쿼리 생성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: tokenData
        ]
        
        // 기존 토큰 삭제
        SecItemDelete(query as CFDictionary)
        
        // 새 토큰 저장
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
            print("토큰이 키체인에 저장되었습니다.")
        } else {
            print("토큰 저장 실패: \(status)")
        }
    }
    
    func getToken(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            if let data = dataTypeRef as? Data,
               let token = String(data: data, encoding: .utf8) {
                return token
            }
        }
        return nil
    }
    
    func deleteToken(forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        SecItemDelete(query as CFDictionary)
    }
}
