//
//  CountUpDownModel.swift
//  Week1
//
//  Created by 이건수 on 2024.09.25.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}
