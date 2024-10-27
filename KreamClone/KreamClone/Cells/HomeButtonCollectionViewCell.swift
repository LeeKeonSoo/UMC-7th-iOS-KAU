//
//  HomeButtonCollectionViewCell.swift
//  KreamClone
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit

class HomeButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeButtonCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "크림 드로우"
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(67)
        }
    }
}
