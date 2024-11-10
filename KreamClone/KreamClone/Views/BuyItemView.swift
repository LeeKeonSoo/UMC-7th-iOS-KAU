//
//  BuyItemView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.04.
//

import UIKit

class BuyItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let buyLabel = UILabel().then {
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private let buySubLabel = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = UIColor(hex: "#929292")
    }
    
    let closeButton = UIButton().then {
        $0.setImage(.closeButton, for: .normal)
    }
    
    private let itemImage = UIImageView().then {
        $0.image = UIImage(named: "item_image")
        $0.layer.cornerRadius = 8
    }
    
    private let itemInfoLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let itemInfoKorLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = UIColor(hex: "#9C9C9C")
    }
    
    let buttonS = SizeButton().then {
        $0.sizeLabel.text = "S"
    }
    
    let buttonM = SizeButton().then {
        $0.sizeLabel.text = "M"
    }
    
    let buttonL = SizeButton().then {
        $0.sizeLabel.text = "L"
    }
    
    let buttonXL = SizeButton().then {
        $0.sizeLabel.text = "XL"
    }
    
    let buttonXXL = SizeButton().then {
        $0.sizeLabel.text = "XXL"
    }
    
    private let underLine = UIView().then {
        $0.backgroundColor = UIColor(hex: "#F3F3F3")
    }
    
    private let quickBuyButton = UIButton().then {
        $0.setImage(.quickBuyButton, for: .normal)
    }
    
    private let normalBuyButton = UIButton().then {
        $0.setImage(.normalBuyButton, for: .normal)
    }
    
    func setupViews() {
        [
            buyLabel,
            buySubLabel,
            closeButton,
            itemImage,
            itemInfoLabel,
            itemInfoKorLabel,
            buttonS,
            buttonM,
            buttonL,
            buttonXL,
            buttonXXL,
            underLine,
            quickBuyButton,
            normalBuyButton,
        ].forEach{ self.addSubview($0) }
        
        buyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        buySubLabel.snp.makeConstraints { make in
            make.top.equalTo(buyLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        itemImage.snp.makeConstraints { make in
            make.top.equalTo(buySubLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(91)
        }
        
        itemInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.top).offset(18)
            make.leading.equalTo(itemImage.snp.trailing).offset(15)
        }
        
        itemInfoKorLabel.snp.makeConstraints { make in
            make.top.equalTo(itemInfoLabel.snp.bottom).offset(4)
            make.leading.equalTo(itemInfoLabel.snp.leading)
        }
        
        buttonS.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.bottom).offset(35)
            make.trailing.equalTo(buttonM.snp.leading).offset(-7)
        }
        
        buttonM.snp.makeConstraints { make in
            make.top.equalTo(buttonS.snp.top)
            make.centerX.equalToSuperview()
        }
        
        buttonL.snp.makeConstraints { make in
            make.top.equalTo(buttonS.snp.top)
            make.leading.equalTo(buttonM.snp.trailing).offset(7)
        }
        
        buttonXL.snp.makeConstraints { make in
            make.top.equalTo(buttonS.snp.bottom).offset(8)
            make.leading.equalTo(buttonS.snp.leading)
        }
        
        buttonXXL.snp.makeConstraints { make in
            make.top.equalTo(buttonXL.snp.top)
            make.leading.equalTo(buttonM.snp.leading)
        }
        
        underLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview().offset(-101)
            make.leading.trailing.equalToSuperview()
        }
        
        quickBuyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(underLine.snp.bottom).offset(10)
        }
        
        normalBuyButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(quickBuyButton.snp.top)
        }
        
        
        
    }

}
