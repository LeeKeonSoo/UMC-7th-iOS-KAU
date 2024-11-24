//
//  ViewController.swift
//  Week9
//
//  Created by 이건수 on 2024.11.23.
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }
    
    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://i.namu.wiki/i/XBLvBZNMEnGq037dspJUL3r_Z6GHcsKy5i4TlKtIO31Ymhs3S7XkAviaEyFXI7cEU4L9ulzG6D5Ik0rHhxngMwxEx01_lHToNGtcVhpnxfbgZEHF1IspHgpDYocI8z-y_nq4rspFER69RYqd_MK2yw.webp")
        return view
    }()


}
