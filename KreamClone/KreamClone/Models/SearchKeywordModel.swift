//
//  SearchKeywordModel.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.18.
//

import Foundation

struct SearchKeywordModel : Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let title: String
}
