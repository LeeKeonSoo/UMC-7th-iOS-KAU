//
//  SearchView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.17.
//

import UIKit

class SearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backButton = UIButton().then {
        $0.setImage(.backArrow, for: .normal)
        $0.backgroundColor = .clear
    }
    
    let searchTextField = UITextField().then {
        $0.backgroundColor = UIColor(hex: "#F5F5F5")
        $0.placeholder = " 브랜드, 상품, 프로필, 태그 등"
        $0.layer.cornerRadius = 10
    }
    
    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let searchResultTableView = UITableView().then {
        $0.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.isHidden = true
    }
    
    private func setupView() {
        [
            backButton,
            searchTextField,
            cancelButton,
            searchResultTableView
        ].forEach { addSubview($0) }
        
        
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(safeAreaLayoutGuide).offset(14)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(7)
            make.height.equalTo(39)
            make.leading.equalTo(backButton.snp.trailing).offset(15)
            make.trailing.equalTo(cancelButton.snp.leading).offset(-11)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(113)
        }
    }

}
