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
    
    let searchTextField = UIButton().then {
        $0.backgroundColor = UIColor(hex: "#F5F5F5")
        $0.setTitle("  브랜드, 상품, 프로필, 태그 등", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.contentHorizontalAlignment = .left
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
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private lazy var justDroppedScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = true
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.alwaysBounceHorizontal = true
    }
    
    private lazy var justDroppedItem = UIImageView().then {
        $0.image = UIImage(named: "just_dropped_list")
    }
    
    private lazy var justDroppedLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private lazy var justDroppedSubLabel = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = UIColor(hex: "#878787")
    }
    
    private lazy var storyScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = true
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.alwaysBounceHorizontal = true
    }
    
    private lazy var storyItem = UIImageView().then {
        $0.image = UIImage(named: "story_list")
    }
    
    private lazy var storyScrollLabel = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private lazy var storyScrollSubLabel = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = UIColor(hex: "#878787")
    }
    
    private let contentView = UIView()
    
    private func setupViews() {
       
        [searchTextField, alertButton, segmentedControl, underLine].forEach { addSubview($0) }
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [
            adImage,
            itemsCollectionView,
            justDroppedScrollView,
            justDroppedLabel,
            justDroppedSubLabel,
            storyScrollView,
            storyScrollLabel,
            storyScrollSubLabel
            
        ].forEach { contentView.addSubview($0) }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.height.equalTo(1200)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(underLine.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(6)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.trailing.equalTo(alertButton.snp.leading).offset(-15)
        }
        
        alertButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(searchTextField)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
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
            make.top.equalTo(contentView)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(374)
        }
        
        itemsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(adImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(182)
            make.width.equalTo(341)
        }
        
        justDroppedScrollView.snp.makeConstraints { make in
            make.top.equalTo(itemsCollectionView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(340)
        }
        
        justDroppedLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedScrollView.snp.top).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        justDroppedSubLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedLabel.snp.bottom).offset(4)
            make.leading.equalTo(justDroppedLabel.snp.leading)
        }
        
        storyScrollView.snp.makeConstraints { make in
            make.top.equalTo(justDroppedScrollView.snp.bottom)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(340)
        }
        
        storyScrollLabel.snp.makeConstraints { make in
            make.top.equalTo(storyScrollView.snp.top).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
        
        storyScrollSubLabel.snp.makeConstraints { make in
            make.top.equalTo(storyScrollLabel.snp.bottom).offset(4)
            make.leading.equalTo(storyScrollLabel.snp.leading)
        }
        
        justDroppedScrollView.addSubview(justDroppedItem)
        
        justDroppedItem.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(73)
            
        }
        
        storyScrollView.addSubview(storyItem)
        
        storyItem.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(73)
            make.bottom.equalToSuperview().offset(-20)
        }
        
    }
}
