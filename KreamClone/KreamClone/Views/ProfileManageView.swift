//
//  ProfileManageView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.30.
//

import UIKit

class ProfileManageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var profileImage: UIImageView = {
        let Image = UIImageView()
        
        Image.image = UIImage(named: "ProfileImage")
        Image.contentMode = .scaleAspectFit
        
        return Image
    } ()
    
    let backButton: UIButton = {
        let Button = UIButton()
        var configuration = UIButton.Configuration.plain()
        
        Button.backgroundColor = .clear
        configuration.image = UIImage(named: "left_view_arrow")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        
        Button.configuration = configuration
        
        return Button
    } ()
    
    private let profileManagementLabel: UILabel = {
        let Label = UILabel()
        
        Label.text = "프로필 관리"
        Label.font = .systemFont(ofSize: 16)
        
        return Label
    } ()
    
    private let profileInformationLabel: UILabel = {
        let Label = UILabel()
        
        Label.text = "프로필 정보"
        Label.font = .systemFont(ofSize: 18)
        
        return Label
    } ()
    
    private let userEmail: UILabel = {
        let Label = UILabel()
        
        Label.text = "유저 이메일"
        Label.font = .systemFont(ofSize: 14)
        
        return Label
    } ()
    
    lazy var userEmailTextField: UITextField = {
        let TextField = UITextField()
        
        TextField.placeholder = " 새로운 이메일을 입력해주세요!"
        TextField.font = .systemFont(ofSize: 14)
        TextField.layer.cornerRadius = 1
        TextField.isUserInteractionEnabled = false
        
        return TextField
    } ()
    
    private let userPassword: UILabel = {
        let Label = UILabel()
        
        Label.text = "유저 비밀번호"
        Label.font = .systemFont(ofSize: 14)
        
        return Label
    } ()
    
    lazy var userPasswordTextField: UITextField = {
        let TextField = UITextField()
        
        TextField.placeholder = " 새로운 비밀번호를 입력해주세요!"
        TextField.font = .systemFont(ofSize: 14)
        TextField.layer.cornerRadius = 1
        TextField.isUserInteractionEnabled = false
        
        return TextField
    } ()
    
    let emailModifyButton: UIButton = {
        let Button = UIButton()
        
        Button.setTitle("변경", for: .normal)
        Button.setTitleColor(.black, for: .normal)
        Button.titleLabel?.font = .systemFont(ofSize: 14)
        Button.layer.borderWidth = 1
        Button.layer.borderColor = UIColor.black.cgColor
        
        return Button
    } ()
    
    let passwordModifyButton: UIButton = {
        let Button = UIButton()
        
        Button.setTitle("변경", for: .normal)
        Button.setTitleColor(.black, for: .normal)
        Button.titleLabel?.font = .systemFont(ofSize: 14)
        Button.layer.borderWidth = 1
        Button.layer.borderColor = UIColor.black.cgColor
        
        return Button
    } ()
    
    private func addComponents() {
        self.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(67)
            $0.leading.equalToSuperview().offset(27)
            $0.height.width.equalTo(25)
        }
        self.addSubview(profileManagementLabel)
        profileManagementLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.top)
            $0.leading.equalTo(backButton.snp.trailing).offset(112)
            $0.height.equalTo(26)
        }
        self.addSubview(profileImage)
        profileImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileManagementLabel.snp.bottom).offset(52)
            $0.height.width.equalTo(90)
        }
        self.addSubview(profileInformationLabel)
        profileInformationLabel.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.leading)
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
        }
        self.addSubview(userEmail)
        userEmail.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.leading)
            $0.top.equalTo(profileInformationLabel.snp.bottom).offset(23)
        }
        self.addSubview(userEmailTextField)
        userEmailTextField.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.leading)
            $0.top.equalTo(userEmail.snp.bottom).offset(4)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        self.addSubview(userPassword)
        userPassword.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.leading)
            $0.top.equalTo(userEmailTextField.snp.bottom).offset(23)
        }
        self.addSubview(userPasswordTextField)
        userPasswordTextField.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.leading)
            $0.top.equalTo(userPassword.snp.bottom).offset(4)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        self.addSubview(emailModifyButton)
        emailModifyButton.snp.makeConstraints {
            $0.top.equalTo(userEmailTextField.snp.top)
            $0.trailing.equalToSuperview().offset(-17)
            $0.height.equalTo(32)
            $0.width.equalTo(58)
        }
        self.addSubview(passwordModifyButton)
        passwordModifyButton.snp.makeConstraints {
            $0.top.equalTo(userPasswordTextField.snp.top)
            $0.trailing.equalToSuperview().offset(-17)
            $0.height.equalTo(32)
            $0.width.equalTo(58)
        }
    }
    
}
