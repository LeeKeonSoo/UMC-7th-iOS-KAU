//
//  HomeSearchCollectionViewCell.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.17.
//

import UIKit

class HomeSearchCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeSearchCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(hex: "#ECECEC")
        contentView.layer.cornerRadius = 20
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let recommendLabel = UILabel().then {
        $0.text = "채원 슈프림 후리스"
        $0.font = .systemFont(ofSize: 13.5)
    }
    
    private func setupViews() {
        contentView.addSubview(recommendLabel)
        
        recommendLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(11)
        }
    }
}
