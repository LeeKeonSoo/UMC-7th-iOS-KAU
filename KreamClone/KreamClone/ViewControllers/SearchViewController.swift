//
//  SearchViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.11.18.
//

import UIKit
import Moya

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    private let provider = MoyaProvider<UserTargetType>()
    private let rootView = SearchView()
    private var searchResults: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view = rootView
        setupDelegates()
        rootView.searchTextField.addTarget(self, action: #selector(searchButtonTapped), for: .editingDidEndOnExit)
        rootView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        rootView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    private func setupDelegates() {
        rootView.searchResultTableView.delegate = self
        rootView.searchResultTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(searchResults.count, 3)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: searchResults[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        48
    }
    
    private func getSearchKeyword(_ query: String) {
        provider.request(.getSearchKeyword(param: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let userResponse = try response.map(SearchKeywordModel.self)
                    print("Success: \(userResponse)")
                    
                    self.searchResults = userResponse.products.prefix(3).map { $0.title }
                    self.rootView.searchResultTableView.isHidden = false
                    self.rootView.searchResultTableView.reloadData()
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func searchButtonTapped() {
        let text = rootView.searchTextField.text
        
        if text?.isEmpty == true {
            return
        } else {
            getSearchKeyword(text ?? "")
        }
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func cancelButtonTapped() {
        if let presentingVC = presentingViewController?.presentingViewController {
            presentingVC.dismiss(animated: true)
        }
    }
    
}
