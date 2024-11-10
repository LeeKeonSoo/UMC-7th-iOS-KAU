//
//  SizeModel.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.10.
//

import UIKit

struct DiffColorModel {
    let image: UIImage
}

extension DiffColorModel {
    static func dummy() -> [DiffColorModel] {
        return [
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff),
            DiffColorModel(image: .imageDiff)
        ]
    }
}
