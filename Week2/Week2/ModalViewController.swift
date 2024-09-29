//
//  ModalViewController.swift
//  Week2
//
//  Created by 이건수 on 2024.09.28.
//

import UIKit

class ModalViewController: UIViewController {
    
    private let label = UILabel()
    private lazy var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어남."
        label.textColor = .cyan
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemIndigo
        
        view.addSubview(label)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .green
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
}
