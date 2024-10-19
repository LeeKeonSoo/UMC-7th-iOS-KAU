//
//  DiceView.swift
//  Week3
//
//  Created by 이건수 on 2024.10.18.
//

import UIKit

class DiceView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "주사위 테이블 뷰 만들기"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        return label
    } ()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(DiceCell.self, forCellReuseIdentifier: DiceCell.identifier)
        table.separatorStyle = .singleLine
        return table
    } ()
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-18)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(14)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
