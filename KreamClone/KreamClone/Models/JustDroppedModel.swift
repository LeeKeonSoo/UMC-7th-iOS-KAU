//
//  JustDroppedModel.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.24.
//

import UIKit

struct JustDroppedModel {
    var itemImage: UIImage
    var dealCount: String
    var brand: String
    var itemName: String
    var price: String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(itemImage: .shoe1, dealCount: "거래 12.8만", brand: "MLB", itemName: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(itemImage: .shoe2, dealCount: "거래 15.6만", brand: "Jordan", itemName: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원"),
            JustDroppedModel(itemImage: .shoe1, dealCount: "거래 12.8만", brand: "MLB", itemName: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(itemImage: .shoe2, dealCount: "거래 15.6만", brand: "Jordan", itemName: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원"),
            JustDroppedModel(itemImage: .shoe1, dealCount: "거래 12.8만", brand: "MLB", itemName: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(itemImage: .shoe2, dealCount: "거래 15.6만", brand: "Jordan", itemName: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원"),
            JustDroppedModel(itemImage: .shoe1, dealCount: "거래 12.8만", brand: "MLB", itemName: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(itemImage: .shoe2, dealCount: "거래 15.6만", brand: "Jordan", itemName: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원"),
            JustDroppedModel(itemImage: .shoe1, dealCount: "거래 12.8만", brand: "MLB", itemName: "청키라이너 뉴욕양키스", price: "139,000원"),
            JustDroppedModel(itemImage: .shoe2, dealCount: "거래 15.6만", brand: "Jordan", itemName: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원")
        ]
    }
}
