//
//  CategoryTableViewCell.swift
//  ExTableCollectionView
//
//  Created by 김종권 on 2022/03/10.
//

import UIKit
import SnapKit
import Then

final class CategoryTableViewCell: UITableViewCell {
  static let id = "CategoryTableViewCell"
  
  private let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.font = .systemFont(ofSize: 20)
  }
  private let collectionView = UICollectionView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.contentView.addSubview(self.titleLabel)
    self.contentView.addSubview(self.collectionView)
    self.titleLabel.snp.makeConstraints {
      $0.top.bottom.left.equalToSuperview()
    }
    self.collectionView.snp.makeConstraints {
      $0.top.equalTo(self.titleLabel.snp.bottom)
      $0.left.right.bottom.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    prepare(title: nil)
  }
  
  func prepare(title: String?) {
    self.titleLabel.text = title
  }
}
