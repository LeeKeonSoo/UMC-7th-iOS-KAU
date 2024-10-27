//
//  ProfileManageViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.30.
//

import UIKit

class ProfileManageViewController: UIViewController {

    let userDefaultsModel = UserDefaultsModel()
    
    public var receivedImage = UIImageView()
    
    let profileManageView = ProfileManageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = profileManageView
        setupButtons()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        profileManageView.profileImage = receivedImage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    private func setupButtons() {
        
        profileManageView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        profileManageView.emailModifyButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        profileManageView.passwordModifyButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        
    }
    
    
    @objc func changeButtonTapped(sender: UIButton) {
        if sender == profileManageView.emailModifyButton {
            profileManageView.userEmailTextField.isUserInteractionEnabled = true
            userDefaultsModel.saveUserEmail(profileManageView.userEmailTextField.text ?? "")
            profileManageView.userEmailTextField.text = ""
            sender.setTitle("확인", for: .normal)
        } else {
            profileManageView.userPasswordTextField.isUserInteractionEnabled = true
            userDefaultsModel.saveUserPassword(profileManageView.userPasswordTextField.text ?? "")
            profileManageView.userPasswordTextField.text = ""
            sender.setTitle("확인", for: .normal)
        }
        
        
    }
    
    @objc func backButtonTapped()  {
        navigationController?.popViewController(animated: true)
    }

}
