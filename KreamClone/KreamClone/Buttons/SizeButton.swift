//
//  SizeButton.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.10.
//

import UIKit

class SizeButton: UIButton {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let sizeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14)
        $0.text = "S"
    }
    
    let priceLabel = UILabel().then {
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 12)
        $0.text = "360,000"
    }
    
    func setupButton() {
        addSubview(sizeLabel)
        addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(1)
            make.centerX.equalToSuperview()
        }
        
        self.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
    }

}
