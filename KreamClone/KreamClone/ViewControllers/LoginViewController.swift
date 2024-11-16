//
//  ViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.25.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import Alamofire


class LoginViewController: UIViewController {
    
    private let userDefaultsModel = UserDefaultsModel()
    private let keychainService = KeychainService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
    }
    
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        loginView.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTap), for: .touchUpInside)
        
        return loginView
    } ()
    
    
    @objc func loginButtonTap() {
        
        guard let email = loginView.emailTextField.text, !email.isEmpty else {
            return
        }
        userDefaultsModel.saveUserEmail(email)
        
        guard let password = loginView.passwordTextField.text, !password.isEmpty else {
            return
        }
        userDefaultsModel.saveUserPassword(password)
        
        navigateToBaseVC()
    }
    
    private func navigateToBaseVC() {
        let BaseVC = BaseViewController()
        BaseVC.modalPresentationStyle = .fullScreen
        present(BaseVC, animated: true, completion: nil)
    }
    
    @objc func kakaoLoginButtonTap() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk{ (oauthToken, error) in
                if let error = error {
                    print("카카오톡 로그인 실패: \(error)")
                } else if let token = oauthToken?.accessToken {
                    print("카카오톡 로그인 성공")
                    self.sendKakaoTokenToServer(token: token)
                    self.keychainService.saveToken(token, forKey: "kakaoAccessToken")
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("카카오 계정 로그인 실패: \(error)")
                } else if let token = oauthToken?.accessToken {
                    print("카카오톡 로그인 성공")
                    self.sendKakaoTokenToServer(token: token)
                    self.keychainService.saveToken(token, forKey: "kakaoAccessToken")
                }
            }
        }
    }
    
    private func sendKakaoTokenToServer(token: String) {
        let url = "https://kapi.kakao.com/v2/user/me"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
                
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let data):
                print("사용자 정보 가져오기 성공: \(data)")
                self.navigateToBaseVC()
            case .failure(let error):
                print("사용자 정보 가져오기 실패: \(error)")
                }
            }
    }
    
}

