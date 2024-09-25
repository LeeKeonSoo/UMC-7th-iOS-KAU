//
//  ViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let loginView = LoginView()
        
        return loginView
    } ()


}

