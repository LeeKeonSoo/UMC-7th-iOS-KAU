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
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchTextField = UIButton().then {
        $0.backgroundColor = UIColor(hex: "#F5F5F5")
        $0.setTitle("  브랜드, 상품, 프로필, 태그 등", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.layer.cornerRadius = 12
    }
    
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let underLine = UIView().then {
        $0.backgroundColor = UIColor(hex: "#DDDDDD")
    }
    
    private let recommendLabel = UILabel().then {
        $0.text = "추천 검색어"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    let recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 12
        $0.itemSize = UICollectionViewFlowLayout.automaticSize
        $0.estimatedItemSize = CGSize(width: 100, height: 32)
    }).then {
        $0.isScrollEnabled = false
        $0.register(HomeSearchCollectionViewCell.self, forCellWithReuseIdentifier: HomeSearchCollectionViewCell.identifier)
    }
    
    private func setupViews() {
        [
            searchTextField,
            cancelButton,
            underLine,
            recommendLabel,
            recommendCollectionView
        ].forEach { addSubview($0) }
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.trailing.equalTo(cancelButton.snp.leading).offset(-15)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        underLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(searchTextField.snp.bottom).offset(11)
            make.leading.trailing.equalToSuperview()
        }
        
        recommendLabel.snp.makeConstraints { make in
            make.top.equalTo(underLine.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
        }
        
        recommendCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendLabel.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(76)
        }
        
        
    }
    
    
}
