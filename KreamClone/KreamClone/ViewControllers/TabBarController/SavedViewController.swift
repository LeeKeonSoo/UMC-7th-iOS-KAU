//
//  SavedViewController.swift
//  KreamClone
//
//  Created by 이건수 on 2024.09.29.
//

import UIKit

class SavedViewController: UIViewController {

    let data = dummyItemModel.itemDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        // Do any additional setup after loading the view.
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.itemList.dataSource = self
        return view
    } ()
    
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
