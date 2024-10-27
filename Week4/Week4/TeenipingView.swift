//
//  TeenipingView.swift
//  Week4
//
//  Created by 이건수 on 2024.10.27.
//

import UIKit
import SnapKit
import Then

class TeenipingView: UIView {
    
    
    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        
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
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    let teenipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 162, height: 144)
        $0.minimumInteritemSpacing = 12
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(TeenipingCollectionViewCell.self, forCellWithReuseIdentifier: TeenipingCollectionViewCell.identifier)
    }
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "뿅~"
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        [
            segmentedControl,
            teenipingCollectionView,
            divideLine,
            emptyLabel
        ].forEach { addSubview($0) }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(92)
            make.height.equalTo(65)
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        teenipingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(19)
            make.bottom.equalToSuperview().inset(74)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(301)
            make.centerX.equalToSuperview()
        }
    }
    
}
