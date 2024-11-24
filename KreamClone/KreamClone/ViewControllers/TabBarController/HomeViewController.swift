//
//  HomeViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.29.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
    
    private let rootView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(rootView)
        
        rootView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupAction()
        setupDelegate()
        
        
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        rootView.searchTextField.addTarget(self, action: #selector(searchTextFieldTapped), for: .touchUpInside)
    }
    
    private func setupDelegate() {
        rootView.itemsCollectionView.dataSource = self
        rootView.justDroppedCollectionView.dataSource = self
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
                return HomeButtonModel.dummy().count
            } else if collectionView.tag == 1 {
                return JustDroppedModel.dummy().count
            }
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeButtonCollectionViewCell.identifier, for: indexPath)
                    as? HomeButtonCollectionViewCell else { return UICollectionViewCell() }
            
            let list = HomeButtonModel.dummy()
            
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].title
            
            return cell
        } else if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell else { return UICollectionViewCell() }
            
            let list = JustDroppedModel.dummy()
            
            cell.itemImage.image = list[indexPath.row].itemImage
            cell.dealCountLabel.text = list[indexPath.row].dealCount
            cell.brandLabel.text = list[indexPath.row].brand
            cell.itemLabel.text = list[indexPath.row].itemName
            cell.priceLabel.text = list[indexPath.row].price
            
            if let url = URL(string: "https://static.luck-d.com/product/6363/main_carousel/NIKE_AIR_FORCE_1_LOW_CACAO_WOW_WMNS_FQ8901259_83610.webp") {
                cell.itemImage.kf.setImage(with: url)
            }
            
            return cell
        } else {return UICollectionViewCell()}
    }
    
    @objc private func searchTextFieldTapped() {
        let VC = HomeSearchViewController()
        VC.modalPresentationStyle = .overFullScreen
        present(VC, animated: true)
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
