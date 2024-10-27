//
//  TeenipingModel.swift
//  Week4
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: .image, name: "하츄핑"),
            TeenipingModel(image: .image, name: "라츄핑"),
            TeenipingModel(image: .image, name: "바츄핑"),
            TeenipingModel(image: .image, name: "아츄핑"),
            TeenipingModel(image: .image, name: "차츄핑"),
            TeenipingModel(image: .image, name: "해핑"),
            TeenipingModel(image: .image, name: "무거핑"),
            TeenipingModel(image: .image, name: "시러핑")
                           
        ]
    }
}
