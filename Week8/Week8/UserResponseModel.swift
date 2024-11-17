//
//  UserResponseModel.swift
//  Week8
//
//  Created by 이건수 on 2024.11.17.
//

import Foundation

struct UserResponseModel: Codable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
}
