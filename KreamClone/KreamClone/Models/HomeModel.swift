//
//  HomeModel.swift
//  KreamClone
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit

struct HomeButtonModel {
    let image: UIImage
    let title: String
}

extension HomeButtonModel {
    static func dummy() -> [HomeButtonModel] {
        return [
            HomeButtonModel(image: .button1, title: "크림 드로우"),
            HomeButtonModel(image: .button2, title: "실시간 차트"),
            HomeButtonModel(image: .button3, title: "남성 추천"),
            HomeButtonModel(image: .button4, title: "여성 추천"),
            HomeButtonModel(image: .button5, title: "색다른 추천"),
            HomeButtonModel(image: .button6, title: "정가 아래"),
            HomeButtonModel(image: .button7, title: "윤세 24AW"),
            HomeButtonModel(image: .button8, title: "올해의 베스트"),
            HomeButtonModel(image: .button9, title: "10월 베네핏"),
            HomeButtonModel(image: .button10, title: "아크네 선물")
        ]
    }
}
