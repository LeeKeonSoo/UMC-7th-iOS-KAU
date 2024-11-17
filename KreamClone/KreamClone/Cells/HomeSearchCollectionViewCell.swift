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
        
        self.backgroundColor = UIColor(hex: "#ECECEC")
        self.layer.cornerRadius = 20
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let recommendLabel = UILabel().then {
        $0.text = "채원 슈프림 후리스"
    }
    
    private func setupViews() {
        addSubview(recommendLabel)
        
        recommendLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(32)
        }
    }
}
