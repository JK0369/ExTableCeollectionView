//
//  MainCategoryHeaderView.swift
//  ExTableCollectionView
//
//  Created by Jake.K on 2022/03/10.
//

import UIKit
import SnapKit
import Then

final class MainCategoryHeaderView: UITableViewHeaderFooterView {
  static let id = "MainCategoryHeaderView"
  
  private let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.numberOfLines = 0
    $0.font = .systemFont(ofSize: 22, weight: .bold)
  }
  private let bottomPaddingView = UIView()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    self.addSubview(self.titleLabel)
    self.addSubview(self.bottomPaddingView)
    self.titleLabel.snp.makeConstraints {
      $0.left.top.right.equalToSuperview()
    }
    self.bottomPaddingView.snp.makeConstraints {
      $0.left.right.bottom.equalToSuperview()
      $0.top.equalTo(self.titleLabel.snp.bottom)
      $0.height.equalTo(10).priority(999)
    }
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(title: nil)
  }
  func prepare(title: String?) {
    self.titleLabel.text = title
  }
}
