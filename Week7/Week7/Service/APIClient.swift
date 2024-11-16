//
//  APIClient.swift
//  Week7
//
//  Created by 이건수 on 2024.11.11.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        let interceptor = AuthrozationInterceptor(kakaoKey: "2468348c6e31d4bcd2b0873e8da39367")
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
}
