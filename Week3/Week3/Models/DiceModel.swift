//
//  DiceModel.swift
//  Week3
//
//  Created by 이건수 on 2024.10.18.
//

import Foundation


struct DiceModel {
    let diceImage: String
    let diceName: String
}

final class dummyDiceModel {
    static let diceDatas: [DiceModel] = [
        DiceModel(diceImage: "dice 1.png", diceName: "주사위 1"),
        DiceModel(diceImage: "dice 2.png", diceName: "주사위 2"),
        DiceModel(diceImage: "dice 3.png", diceName: "주사위 3"),
        DiceModel(diceImage: "dice 4.png", diceName: "주사위 4"),
        DiceModel(diceImage: "dice 5.png", diceName: "주사위 5"),
        DiceModel(diceImage: "dice 6.png", diceName: "주사위 6")
    ]
}
