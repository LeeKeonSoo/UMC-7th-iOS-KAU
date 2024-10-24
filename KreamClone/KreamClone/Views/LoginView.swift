//
//  LoginView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.25.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UIImageView = {
        let titleLabel = UIImageView()
    
        titleLabel.image = UIImage(named: "KreamLogo")
        titleLabel.contentMode = .scaleAspectFit
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        return titleLabel
    } ()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        
        emailLabel.text = "이메일 주소"
        emailLabel.font = .systemFont(ofSize: 12)
        emailLabel.textColor = .black
        emailLabel.textAlignment = .left
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return emailLabel
    } ()
    
    public lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        
        emailTextField.placeholder = "  예) kream@kream.co.kr"
        emailTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 15
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    } ()
    
    private lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        
        passwordLabel.text = "비밀번호"
        passwordLabel.font = .systemFont(ofSize: 12)
        passwordLabel.textColor = .black
        passwordLabel.textAlignment = .left
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordLabel
    } ()
    
    public lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        
        passwordTextField.placeholder = "  비밀번호를 입력해주세요"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 15
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    } ()
    
    public lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.tintColor = .white
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        loginButton.backgroundColor = .lightGray
        loginButton.layer.cornerRadius = 8
        loginButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        return loginButton
    } ()
    
    private lazy var kakaoLoginImage: UIImageView = {
        let kakaoLoginImage = UIImageView()
        
        kakaoLoginImage.image = UIImage(named: "KakaoLogin")
        kakaoLoginImage.contentMode = .scaleAspectFit
        
        kakaoLoginImage.translatesAutoresizingMaskIntoConstraints = false
        
        return kakaoLoginImage
    } ()
    
    private lazy var kakaoLoginButton: UIButton = {
        let kakaoLoginButton = UIButton()
        
        kakaoLoginButton.backgroundColor = .clear
        
        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        return kakaoLoginButton
    } ()
    
    private lazy var appleLoginImage: UIImageView = {
        let appleLoginImage = UIImageView()
        
        appleLoginImage.image = UIImage(named: "AppleLogin")
        appleLoginImage.contentMode = .scaleAspectFit
        
        appleLoginImage.translatesAutoresizingMaskIntoConstraints = false
        
        return appleLoginImage
    } ()
    
    private lazy var appleLoginButton: UIButton = {
        let appleLoginButton = UIButton()
        
        appleLoginButton.backgroundColor = .clear
        
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        return appleLoginButton
    } ()
    
    private func addComponents() {
        self.addSubview(titleLabel)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginImage)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginImage)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            
            emailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 87),
            
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            
            passwordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            
            kakaoLoginImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kakaoLoginImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            kakaoLoginImage.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            
            kakaoLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            kakaoLoginButton.centerYAnchor.constraint(equalTo: kakaoLoginImage.centerYAnchor),
            
            appleLoginImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appleLoginImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            appleLoginImage.topAnchor.constraint(equalTo: kakaoLoginImage.bottomAnchor, constant: 22),
            
            appleLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appleLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            appleLoginButton.centerYAnchor.constraint(equalTo: appleLoginImage.centerYAnchor)
        ])
        
        
    }

    
}
