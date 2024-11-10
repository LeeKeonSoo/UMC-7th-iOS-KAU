//
//  BuyItemViewViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.04.
//

import UIKit

class BuyItemViewController: UIViewController {
    
    private var prevButton: UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButton()

    }
    
    private let buyItemView: BuyItemView = {
        let view = BuyItemView()
        return view
    }()
    
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(buyItemView)
        buyItemView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupButton() {
        buyItemView.closeButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        buyItemView.buttonS.addTarget(self, action: #selector(selectSize), for: .touchUpInside)
        buyItemView.buttonM.addTarget(self, action: #selector(selectSize), for: .touchUpInside)
        buyItemView.buttonL.addTarget(self, action: #selector(selectSize), for: .touchUpInside)
        buyItemView.buttonXL.addTarget(self, action: #selector(selectSize), for: .touchUpInside)
        buyItemView.buttonXXL.addTarget(self, action: #selector(selectSize), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectSize(sender: UIButton) {
        sender.layer.borderColor = UIColor.black.cgColor
        prevButton?.layer.borderColor = UIColor.lightGray.cgColor
        prevButton = sender
    }
    

}


