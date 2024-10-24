//
//  ViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let userDefaultsModel = UserDefaultsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
    }
    
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        
        return loginView
    } ()
    
    
    @objc func loginButtonTap() {
        let BaseVC = BaseViewController()
        BaseVC.modalPresentationStyle = .fullScreen
        present(BaseVC, animated: true, completion: nil)
        
        guard let email = loginView.emailTextField.text, !email.isEmpty else {
            return
        }
        
        userDefaultsModel.saveUserEmail(email)
        
        guard let password = loginView.passwordTextField.text, !password.isEmpty else {
            return
        }
        
        userDefaultsModel.saveUserPassword(password)
    }
    
    
}

