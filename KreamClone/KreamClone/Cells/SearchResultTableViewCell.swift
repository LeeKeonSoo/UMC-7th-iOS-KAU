//
//  SearchListTableViewCell.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.23.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button = UIButton().then {
        $0.backgroundColor = .clear
        $0.setTitle("", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(.black, for: .normal)
        $0.contentHorizontalAlignment = .left
    }
    
    private func setupViews() {
        contentView.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with text: String) {
        button.setTitle(text, for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle("", for: .normal)
    }
    
}
