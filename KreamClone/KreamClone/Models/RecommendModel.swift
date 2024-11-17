//
//  SearchModel.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.17.
//

import UIKit

struct RecommendModel {
    let keyword: String
}

extension RecommendModel {
    static func dummy() -> [RecommendModel] {
        return [
            RecommendModel(keyword: "채원 슈프림 후리스"),
            RecommendModel(keyword: "나이키V2K런"),
            RecommendModel(keyword: "뉴발란드996"),
            RecommendModel(keyword: "신상 나이키 콜라보"),
            RecommendModel(keyword: "허그 FW 패딩"),
            RecommendModel(keyword: "벨루어 눕시")
        ]
    }
}
