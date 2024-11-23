//
//  HomeSearchViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.17.
//

import UIKit

class HomeSearchViewController: UIViewController, UICollectionViewDelegate {

    private let rootView = HomeSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(rootView)
        
        rootView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupDelegate()
        setupAction()
    }
    
    private func setupDelegate() {
        rootView.recommendCollectionView.dataSource = self
        rootView.recommendCollectionView.delegate = self
    }
    
    private func setupAction() {
        rootView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        rootView.searchTextField.addTarget(self, action: #selector(searchTextFieldTapped), for: .touchUpInside)
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func searchTextFieldTapped() {
        let VC = SearchViewController()
        VC.modalPresentationStyle = .overFullScreen
        present(VC, animated: true)
    }
    
}

extension HomeSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecommendModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSearchCollectionViewCell.identifier, for: indexPath) as?
            HomeSearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let list = RecommendModel.dummy()
        
        cell.recommendLabel.text = list[indexPath.row].keyword
        
        return cell
    }
}

