//
//  UserDefaultView.swift
//  Week3
//
//  Created by 이건수 on 2024.10.11.
//

import UIKit

class UserDefaultView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setStackView()
        addViewConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UserDefaults 실습 뷰"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    } ()
    
    public lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아무 텍스트나 입력해주세요"
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 14)
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        textField.leftViewMode = .always
        
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        
        return textField
    } ()
    
    public lazy var saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("UserDefaults에 저장하기", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor.gray
        
        return btn
    } ()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        stackView.spacing = 26
        return stackView
    } ()
    
    
    
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "UserDefaults 값 출력 라벨"
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    } ()
    
    public lazy var showTextValue: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "UserDefaults 값이 출력됩니다"
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.cornerRadius = 10
        return label
    } ()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 21
        return stackView
    } ()
    
    private func setStackView() {
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(inputTextField)
        topStackView.addArrangedSubview(saveButton)
        
        bottomStackView.addArrangedSubview(subTitleLabel)
        bottomStackView.addArrangedSubview(showTextValue)
    }
    
    private func addViewConstarints() {
        self.addSubview(topStackView)
        self.addSubview(bottomStackView)
        
        topStackView.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(197)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
        }
        
        inputTextField.snp.makeConstraints() { make in
            make.height.equalTo(52)
            make.width.equalTo(309)
        }
        
        saveButton.snp.makeConstraints() { make in
            make.height.equalTo(42)
            make.width.equalTo(222)
        }
        
        bottomStackView.snp.makeConstraints() { make in
            make.top.equalTo(topStackView.snp.bottom).offset(114)
            make.left.equalToSuperview().offset(56.5)
            make.right.equalToSuperview().offset(-56.5)
        }
        
        subTitleLabel.snp.makeConstraints() { make in
            make.width.equalTo(280)
            make.height.equalTo(24)
        }
        
        showTextValue.snp.makeConstraints() { make in
            make.width.equalTo(280)
            make.height.equalTo(172)
        }
    }
}
    
