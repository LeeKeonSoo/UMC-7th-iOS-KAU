//
//  MyView.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.29.
//

import UIKit

class MyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var settingsImage: UIImageView = {
        let Image = UIImageView()
        
        Image.image = UIImage(named: "Settings")
        Image.contentMode = .scaleAspectFit
        
        return Image
    } ()
    
    private lazy var cameraImage: UIImageView = {
        let Image = UIImageView()
        
        Image.image = UIImage(named: "Vector")
        Image.contentMode = .scaleAspectFit
        
        return Image
    } ()
    
    private lazy var profileImage: UIImageView = {
        let Image = UIImageView()
        
        Image.image = UIImage(named: "ProfileImage")
        Image.contentMode = .scaleAspectFit
        
        return Image
    } ()
    
    private lazy var nicknameLabel: UILabel = {
        let Label = UILabel()
        
        Label.text = "Jeong_iOS"
        Label.font = .systemFont(ofSize: 16)
        Label.textColor = .black
        Label.textAlignment = .left
        
        return Label
    } ()
    
    private lazy var followerCount: UILabel = {
        let Label = UILabel()
        
        Label.text = "팔로워 326"
        Label.font = .systemFont(ofSize: 12)
        Label.textColor = .black
        
        return Label
    } ()
    
    private lazy var followingCount: UILabel = {
        let Label = UILabel()
        
        Label.text = "팔로윙 20"
        Label.font = .systemFont(ofSize: 12)
        Label.textColor = .black
        
        return Label
    } ()
    
    public lazy var profileManageButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        return button
    } ()
    
    private lazy var profileShareButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .clear
        
        return button
    } ()
    
    private func addComponents() {
        self.addSubview(settingsImage)
        settingsImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(32.5)
            $0.top.equalToSuperview().offset(75)
            $0.height.width.equalTo(25)
        }
        
        self.addSubview(cameraImage)
        cameraImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.top.equalToSuperview().offset(75)
            $0.height.width.equalTo(25)
        }
        
        self.addSubview(profileImage)
        profileImage.snp.makeConstraints {
            $0.leading.equalTo(settingsImage.snp.leading)
            $0.top.equalTo(settingsImage.snp.bottom).offset(26)
            $0.height.width.equalTo(90)
        }
        
        self.addSubview(nicknameLabel)
        nicknameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImage.snp.top).offset(21)
            $0.height.equalTo(23)
            $0.width.equalTo(115)
        }
        
        self.addSubview(followerCount)
        followerCount.snp.makeConstraints {
            $0.leading.equalTo(nicknameLabel.snp.leading)
            $0.bottom.equalTo(profileImage.snp.bottom).offset(-21)
        }
        
        self.addSubview(followingCount)
        followingCount.snp.makeConstraints {
            $0.trailing.equalTo(nicknameLabel.snp.trailing)
            $0.bottom.equalTo(followerCount.snp.bottom)
        }
        
        self.addSubview(profileManageButton)
        profileManageButton.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.leading)
            $0.top.equalTo(profileImage.snp.bottom).offset(26)
            $0.height.equalTo(26)
            $0.width.equalTo(157)
        }
        
        self.addSubview(profileShareButton)
        profileShareButton.snp.makeConstraints {
            $0.trailing.equalTo(cameraImage.snp.trailing)
            $0.top.equalTo(profileManageButton.snp.top)
            $0.height.equalTo(26)
            $0.width.equalTo(157)
        }
            
    }
}
