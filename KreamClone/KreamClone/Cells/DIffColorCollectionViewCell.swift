//
//  SizeCollectionViewCell.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.10.
//

import UIKit

class DiffColorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiffColorCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productImage = UIImageView().then {
        $0.image = UIImage(named: "image_diff_color")
        $0.contentMode = .scaleAspectFit
    }
    
    private func setupView() {
        addSubview(productImage)
        
        productImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
