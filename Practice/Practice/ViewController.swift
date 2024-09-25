//
//  ViewController.swift
//  Practice
//
//  Created by 이건수 on 2024.09.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    var count = 0
    let countLabel = UILabel()
    let upbutton = UIButton()
    let downbutton = UIButton()
    let upLabel = UILabel()
    let downLabel = UILabel()
    
    
    func setup() {
        view.addSubview(countLabel)
        
        countLabel.text = "\(count)"
        countLabel.font = UIFont.systemFont(ofSize: 42)
        countLabel.textAlignment = .center
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 327),
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110.5)
        ])
        
        view.addSubview(downbutton)
        view.addSubview(upbutton)
        
        downbutton.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        downbutton.backgroundColor = .clear
        downbutton.tintColor = .black
        
        upbutton.setImage(UIImage(systemName: "arrowtriangle.up.fill"), for: .normal)
        upbutton.backgroundColor = .clear
        upbutton.tintColor = .black
        
        
        downbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downbutton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
            downbutton.leadingAnchor.constraint(equalTo: countLabel.leadingAnchor, constant: 18.5)
        ])
        
        upbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upbutton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
            upbutton.trailingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: -18.5)
        ])
        
        view.addSubview(upLabel)
        
        upLabel.text = "숫자 올리기"
        upLabel.font = .systemFont(ofSize: 16, weight: .medium)
        upLabel.textColor = .black
        
        upLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upLabel.topAnchor.constraint(equalTo: upbutton.bottomAnchor, constant: 5),
            upLabel.centerXAnchor.constraint(equalTo: upbutton.centerXAnchor),
            upLabel.leadingAnchor.constraint(equalTo: upbutton.leadingAnchor, constant: 5)
        ])
        
        upbutton.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        downbutton.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
    }
    
    @objc func upButtonTapped() {
        count += 1
        updateCountLabel()
    }
    
    func updateCountLabel() {
        countLabel.text = "\(count)"
    }
    
    @objc func downButtonTapped() {
        count -= 1
        updateCountLabel()
    }
    
}
