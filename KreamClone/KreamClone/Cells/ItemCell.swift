//
//  ItemCell.swift
//  KreamClone
//
//  Created by 이건수 on 2024.10.19.
//

import UIKit

class ItemCell: UITableViewCell {

    static let identifier = "ItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        
        return imageView
    } ()
    
    private lazy var itemName: UILabel = {
        let name = UILabel()
        name.font = .systemFont(ofSize: 12, weight: .bold)
        name.textColor = .black
        
        return name
    } ()
    
    private lazy var itemDescription: UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 9)
        description.textColor = .lightGray
    
        return description
    } ()
    
    private lazy var itemPrice: UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: 14, weight: .bold)
        
        return price
    } ()
    
    private lazy var itemMarked: UIButton = {
        let marked = UIButton()
        marked.setImage(UIImage(named: "marked"), for: .normal)
        
        return marked
    } ()
    
    private func setViews() {
        self.addSubview(itemImageView)
        self.addSubview(itemName)
        self.addSubview(itemDescription)
        self.addSubview(itemPrice)
        self.addSubview(itemMarked)
    }
    
    private func setConstraints() {
        itemImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().offset(-308)
            make.top.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-14)
            make.height.width.equalTo(72)
        }
        
        itemName.snp.makeConstraints { make in
            make.leading.equalTo(itemImageView.snp.trailing).offset(13)
            make.trailing.equalTo(itemDescription.snp.trailing)
            make.top.equalTo(itemImageView.snp.top)
        }
        
        itemDescription.snp.makeConstraints { make in
            make.leading.equalTo(itemName.snp.leading)
            make.top.equalTo(itemName.snp.bottom)
            make.width.equalTo(153)
        }
        
        itemMarked.snp.makeConstraints { make in
            make.top.equalTo(itemName.snp.top).offset(5)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        itemPrice.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    public func configure(model: ItemModel) {
        self.itemImageView.image = UIImage(named: model.itemImage)
        self.itemName.text = model.itemName
        self.itemDescription.text = model.itemDescription
        self.itemPrice.text = model.itemPrice
    }
    
}
