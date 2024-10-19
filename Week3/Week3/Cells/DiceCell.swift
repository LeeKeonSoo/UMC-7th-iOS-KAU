//
//  DiceCell.swift
//  Week3
//
//  Created by 이건수 on 2024.10.18.
//

import UIKit
import SnapKit

class DiceCell: UITableViewCell {

    static let identifier = "DiceCell"
    
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
        self.diceImageView.image = nil
        self.diceName.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private lazy var diceImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var diceName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20)
        name.textColor = UIColor.black
        
        return name
    }()
    
    private func setViews() {
        self.addSubview(diceImageView)
        self.addSubview(diceName)
    }
    
    private func setConstraints() {
        diceImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.leading.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-10)
            make.width.height.equalTo(75)
        }
        
        diceName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36.5)
            make.leading.equalTo(diceImageView.snp.trailing).offset(87)
            make.trailing.equalToSuperview().offset(-144)
            
        }
    }
    
    // ViewController가 Cell에 접근하여 Cell 내부 컴포넌트의 값을 바꿀 수 있게
    public func configure(model: DiceModel) {
        self.diceImageView.image = UIImage(named: model.diceImage)
        self.diceName.text = model.diceName
    }
    
}
