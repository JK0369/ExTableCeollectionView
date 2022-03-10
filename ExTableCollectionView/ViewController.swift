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
  private lazy var tableView = UITableView().then {
    $0.separatorStyle = .none
    $0.rowHeight = 120
    $0.dataSource = self
    $0.delegate = self
    $0.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.id)
    $0.register(MainCategoryHeaderView.self, forHeaderFooterViewReuseIdentifier: MainCategoryHeaderView.id)
  }
  
  private var dataSource = [CategoryModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.tableView)
    self.tableView.snp.makeConstraints {
      $0.edges.equalTo(self.view.safeAreaLayoutGuide)
    }
    self.dataSource = sampleModel
    self.tableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    self.dataSource.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.dataSource[section].subCategoryList.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.id, for: indexPath) as! CategoryTableViewCell
    let row = self.dataSource[indexPath.section].subCategoryList[indexPath.row]
    cell.prepare(subTitle: row.name, colorModelList: row.colors)
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainCategoryHeaderView.id) as! MainCategoryHeaderView
    cell.prepare(title: self.dataSource[section].name)
    return cell
  }
}
