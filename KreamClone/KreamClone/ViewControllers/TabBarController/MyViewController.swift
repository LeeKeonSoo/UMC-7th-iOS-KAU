//
//  MyViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.29.
//

import UIKit
import SnapKit

class MyViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    } ()
    
    
    private var myView: MyView {
        let myview = MyView()
        
        myview.profileManageButton.addTarget(self, action: #selector(profileButtonTap), for: .touchUpInside)
        
        return myview
    }
    
    @objc func profileButtonTap() {
        let profileManageVC = ProfileManageViewController()
        navigationController?.pushViewController(profileManageVC, animated: true)
        
    }
    
}
