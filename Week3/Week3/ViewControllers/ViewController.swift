//
//  ViewController.swift
//  Week3
//
//  Created by 이건수 on 2024.10.05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let userDefaultsModel = UserDefaultsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = userDefaultsview
        view.backgroundColor = .white
        loadTextValue()
    }

    
    private lazy var userDefaultsview: UserDefaultView = {
        let view = UserDefaultView()
        view.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        return view
    } ()
    
    @objc func saveButtonClicked() {
        guard let text = userDefaultsview.inputTextField.text, !text.isEmpty else {
            return
        }
        
        userDefaultsModel.saveUserText(text)
        
        userDefaultsview.showTextValue.text = text
    }
    
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText() {
            userDefaultsview.showTextValue.text = savedText
        }
    }

}
