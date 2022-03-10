//
//  ColorCollectionViewCell.swift
//  ExTableCollectionView
//
//  Created by 김종권 on 2022/03/10.
//

import UIKit
import SnapKit
import Then

final class ColorCollectionViewCell: UICollectionViewCell {
  static let id = "ColorCollectionViewCell"
  
  private let colorView = UIView()
  private let nameLabel = UILabel().then {
    $0.textColor = .black
    $0.font = .systemFont(ofSize: 14)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(self.colorView)
    self.addSubview(self.nameLabel)
    self.colorView.snp.makeConstraints {
      $0.left.top.right.equalToSuperview()
    }
    self.nameLabel.snp.makeConstraints {
      $0.top.equalTo(self.colorView.snp.bottom)
      $0.left.bottom.right.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(color: nil, name: nil)
  }
  func prepare(color: UIColor?, name: String?) {
    self.colorView.backgroundColor = color
    self.nameLabel.text = name
  }
}
