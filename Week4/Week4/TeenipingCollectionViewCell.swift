//
//  TeenipingCollectionViewCell.swift
//  Week4
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit

class TeenipingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeenipingCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .black
        $0.text = "티니핑"
    }
    
    private func setupViews() {
        [
            imageView,
            titleLabel
        ].forEach{ addSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(4)
        }
    }
}
