//
//  SavedView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.10.20.
//

import UIKit

class SavedView: UIView {

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
        
        label.text = "Saved"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        
        return label
    } ()
    
    private lazy var itemCount: UILabel = {
        let count = UILabel()
        
        count.text = "전체 \(dummyItemModel.itemCounts)개"
        count.font = .systemFont(ofSize: 14, weight: .regular)
        count.textColor = .black
        
        return count
    } ()
    
    public lazy var itemList: UITableView = {
        let item = UITableView()
        item.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        item.separatorStyle = .singleLine
        return item
    } ()
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(itemCount)
        self.addSubview(itemList)
    }
    
    private func setConstraints() {
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(61)
        }
        
        itemCount.snp.makeConstraints { make in
            make.leading.equalTo(title.snp.leading).offset(3)
            make.top.equalTo(title.snp.bottom).offset(16)
        }
        
        itemList.snp.makeConstraints { make in
            make.top.equalTo(itemCount.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
}
