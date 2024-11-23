//
//  UserTargetType.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.18.
//

import Foundation
import Moya

enum UserTargetType {
    case getSearchKeyword(param: String)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string:  "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getSearchKeyword:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchKeyword:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearchKeyword(let keyword):
            return .requestParameters(parameters: ["q": keyword], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
