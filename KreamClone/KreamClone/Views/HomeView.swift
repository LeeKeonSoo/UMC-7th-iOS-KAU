//
//  HomeView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit
import Then

class HomeView: UIView {

    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        
        $0.setContentPositionAdjustment(.zero, forSegmentType: .any, barMetrics: .default)
            
        let emptyImage = UIImage()
        $0.setDividerImage(emptyImage,
                          forLeftSegmentState: .normal,
                          rightSegmentState: .normal,
                          barMetrics: .default)
        
        $0.apportionsSegmentWidthsByContent = true
    
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold),
                .underlineColor: UIColor.black
            ],
            for: .selected
            )
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let underLine = UIView().then {
        $0.backgroundColor = UIColor.black
    }
    
    private let searchLabel = UITextField().then {
        $0.backgroundColor = UIColor(hex: "#F5F5F5")
        $0.placeholder = "  브랜드, 상품, 프로필, 태그 등"
        $0.layer.cornerRadius = 12
    }
    
    private let alertButton = UIButton().then {
        $0.setImage(UIImage(named: "icon_alert"), for: .normal)
        $0.backgroundColor = .clear
    }
    
    private let adImage = UIImageView().then {
        $0.image = UIImage(named: "image_ad")
    }
    
    let itemsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeButtonCollectionViewCell.self, forCellWithReuseIdentifier: HomeButtonCollectionViewCell.identifier)
    }
    
    private func setupViews() {
        [
            searchLabel,
            alertButton,
            segmentedControl,
            underLine,
            adImage,
            itemsCollectionView
            
            
        ].forEach {addSubview($0)}
        
        searchLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.trailing.equalTo(alertButton.snp.leading).offset(-15)
        }
        
        alertButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(searchLabel)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(27)
            make.centerX.equalToSuperview()
        }
        
        underLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(8)
            make.height.equalTo(2)
            make.width.equalTo(28)
            make.leading.equalTo(segmentedControl.snp.leading)
        }
        
        
        adImage.snp.makeConstraints { make in
            make.top.equalTo(underLine.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(374)
        }
        
        itemsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(adImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(182)
            make.width.equalTo(341)
        }
    }
}
