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
        rootView.segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
    }
    
    private func setupDelegate() {
        rootView.itemsCollectionView.dataSource = self
    }
    
    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        
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

    

}
