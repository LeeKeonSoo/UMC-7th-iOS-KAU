//
//  HomeViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.29.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
    
    private let rootView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view = rootView
        
        setupAction()
        setupDelegate()
        
        
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    private func setupDelegate() {
        rootView.itemsCollectionView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeButtonModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeButtonCollectionViewCell.identifier, for: indexPath)
                as? HomeButtonCollectionViewCell else { return UICollectionViewCell() }
        
        let list = HomeButtonModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].title
        
        return cell
    }
    
    @objc func searchTextFieldtapped() {
        
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedTitle = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
        let titleFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        let titleWidth = (selectedTitle as NSString).size(withAttributes: [.font: titleFont]).width
        
        let titles = (0..<sender.numberOfSegments).map { sender.titleForSegment(at: $0) ?? "" }
        let allWidths = titles.map { ($0 as NSString).size(withAttributes: [.font: titleFont]).width }
        
        let totalWidth = sender.frame.width
        let totalTextWidth = allWidths.reduce(0, +)
        let totalSpacing = totalWidth - totalTextWidth
        let spacing = totalSpacing / CGFloat(titles.count - 1)
        
        var xOffset: CGFloat = 0
        for i in 0..<sender.selectedSegmentIndex {
            xOffset += allWidths[i] + spacing
        }
        
        UIView.animate(withDuration: 0.3) {
            self.rootView.underLine.snp.remakeConstraints { make in
                make.top.equalTo(self.rootView.segmentedControl.snp.bottom).offset(8)
                make.height.equalTo(2)
                make.width.equalTo(titleWidth)
                make.leading.equalTo(self.rootView.segmentedControl.snp.leading).offset(xOffset)
            }
            self.rootView.layoutIfNeeded()
        }
    }
}
