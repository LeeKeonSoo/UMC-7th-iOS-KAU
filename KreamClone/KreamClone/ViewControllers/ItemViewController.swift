//
//  ItemViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.03.
//

import UIKit

class ItemViewController: UIViewController, UICollectionViewDelegate {

    private let rootView = ItemView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = rootView
        setupDelegate()
        setupButton()
        
    }
    
    private func setupButton() {
        rootView.buyButton.addTarget(self, action: #selector(buyButtonTap), for: .touchUpInside)
    }

    @objc func buyButtonTap() {
        let buyItemVC = BuyItemViewController()
        buyItemVC.modalPresentationStyle = .pageSheet
        present(buyItemVC, animated: true, completion: nil)
        
    }
    
    private func setupDelegate() {
        rootView.itemCollectionView.dataSource = self
    }

}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DiffColorModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DiffColorCollectionViewCell.identifier,
            for: indexPath
        ) as? DiffColorCollectionViewCell else { return UICollectionViewCell() }
        
        let list = DiffColorModel.dummy()
        
        cell.productImage.image = list[indexPath.row].image
        
        return cell
    }
}
