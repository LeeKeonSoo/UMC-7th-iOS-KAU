//
//  JustDroppedCollectionViewCell.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.24.
//

import UIKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JustDroppedCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let itemImage = UIImageView().then {
        $0.layer.cornerRadius = 12
    }
    
    let dealCountLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10)
    }
    
    let bookmarkButton = UIButton().then {
        $0.setImage(.marked, for: .normal)
    }
    
    let brandLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.text = "MLB"
    }
    
    let itemLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
        $0.text = "청키라이너 뉴욕양키스"
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    let priceLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.text = "139,000원"
    }
    
    private let buyNowLabel = UILabel().then {
        $0.textColor = UIColor(hex: "#A2A2A2")
        $0.font = .systemFont(ofSize: 10)
        $0.text = "즉시 구매가"
    }
    
    private let baseButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    private func setupViews() {
        self.addSubview(baseButton)
        
        [
            itemImage,
            dealCountLabel,
            bookmarkButton
        ].forEach { addSubview($0) }
        
        [
            brandLabel,
            itemLabel,
            priceLabel,
            buyNowLabel
        ].forEach { baseButton.addSubview($0) }
    }
    
    private func setupConstraints() {
        
        itemImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.width.equalTo(142)
        }
        
        baseButton.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(itemImage.snp.bottom)
            make.width.equalTo(142)
            make.height.equalTo(95)
        }
        
        dealCountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.bottom.equalTo(itemImage.snp.bottom).offset(-10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(4)
        }
        
        itemLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(3)
            make.leading.equalTo(brandLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-14)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(buyNowLabel.snp.top).offset(-2)
            make.leading.equalTo(brandLabel.snp.leading)
        }
        
        buyNowLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(brandLabel.snp.leading)
        }
    }
}
