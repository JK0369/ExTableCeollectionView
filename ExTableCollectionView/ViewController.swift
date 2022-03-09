//
//  ViewController.swift
//  ExTableCollectionView
//
//  Created by 김종권 on 2022/03/09.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
  private let tableView = UITableView().then {
    $0.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.id)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.tableView)
    self.tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
