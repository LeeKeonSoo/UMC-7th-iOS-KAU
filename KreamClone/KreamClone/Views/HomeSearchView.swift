//
//  HomeSearchView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit

class HomeSearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchLabel = UITextField().then {
        $0.backgroundColor = UIColor.lightGray
        $0.placeholder = "  브랜드, 상품, 프로필, 태그 등"
        $0.layer.cornerRadius = 12
    }
    
    
    
}
