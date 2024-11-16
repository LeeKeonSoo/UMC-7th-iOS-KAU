//
//  SearchModel.swift
//  Week7
//
//  Created by 이건수 on 2024.11.11.
//

import Foundation

struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contestText: String
    let date: String
    let titleText: String
    let urlText: String
    
    enum CodingKeys: String, CodingKey {
        case contestText = "contents"
        case date = "datetime"
        case titleText = "title"
        case urlText = "url"
    }
}
