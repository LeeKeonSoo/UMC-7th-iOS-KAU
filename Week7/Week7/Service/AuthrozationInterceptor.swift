//
//  AuthrozationInterceptor.swift
//  Week7
//
//  Created by 이건수 on 2024.11.11.
//

import Foundation
import Alamofire

class AuthrozationInterceptor: RequestInterceptor {
    private let kakaoKey: String
    
    init(kakaoKey: String) {
        self.kakaoKey = kakaoKey
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.setValue("KakaoAK \(kakaoKey)", forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
