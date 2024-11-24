//
//  ItemView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.03.
//

import UIKit

class ItemView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("iit(coder:) has not been implemented")
    }
    
    private let backButton = UIButton().then {
        $0.setImage(.backArrow, for: .normal)
    }
    
    private let itemImage = UIImageView().then {
        $0.image = UIImage(named: "item_image")
    }
    
    let itemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(DiffColorCollectionViewCell.self, forCellWithReuseIdentifier: DiffColorCollectionViewCell.identifier)
    }
    
    private let buyLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private let productInfoLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let productInfoKorLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = UIColor(hex: "#9C9C9C")
    }
    
    private let underLine = UIView().then {
        $0.backgroundColor = UIColor(hex: "#F3F3F3")
    }
    
    private let saveButton = UIButton().then {
        $0.setImage(.saveCount, for: .normal)
    }
    
    let buyButton = UIButton().then {
        $0.setImage(.buyButton, for: .normal)
    }
    
    let sellButton = UIButton().then {
        $0.setImage(.sellButton, for: .normal)
    }
    
    private func setupViews() {
        [
            backButton,
            itemImage,
            buyLabel,
            priceLabel,
            underLine,
            itemCollectionView,
            productInfoLabel,
            productInfoKorLabel,
            saveButton,
            buyButton,
            sellButton
        ].forEach{self.addSubview($0)}
        
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(safeAreaLayoutGuide).offset(14)
        }
        
        itemImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(backButton.snp.bottom).offset(10)
        }
        
        itemCollectionView.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(53)
        }
        
        
        buyLabel.snp.makeConstraints { make in
            make.top.equalTo(itemCollectionView.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(buyLabel.snp.bottom).offset(4)
            make.leading.equalTo(buyLabel.snp.leading)
        }
        
        productInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(18)
            make.leading.equalTo(buyLabel.snp.leading)
        }
        
        productInfoKorLabel.snp.makeConstraints { make in
            make.top.equalTo(productInfoLabel.snp.bottom).offset(6)
            make.leading.equalTo(buyLabel.snp.leading)
        }
        
        underLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-95)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(underLine.snp.bottom).offset(12)
        }
        
        buyButton.snp.makeConstraints { make in
            make.trailing.equalTo(sellButton.snp.leading).offset(-6)
            make.top.equalTo(sellButton.snp.top)
        }
        
        sellButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(underLine.snp.bottom).offset(8)
        }
        
        
    }
}
