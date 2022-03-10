//
//  CategoryModel.swift
//  ExTableCollectionView
//
//  Created by 김종권 on 2022/03/09.
//

import UIKit

struct CategoryModel {
  let name: String
  let subCategoryList: [SubCategory]
}

struct SubCategory {
  let name: String
  let colors: [ColorModel]
}

struct ColorModel {
  let name: String
  let color: UIColor
}

let sampleModel = [
  CategoryModel(
    name: "메인1",
    subCategoryList: [
      SubCategory(
        name: "서브1.1",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브1.2",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      )
    ]
  ),
  CategoryModel(
    name: "메인2",
    subCategoryList: [
      SubCategory(
        name: "서브2.1",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브2.2",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브123",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      )
    ]
  ),
  CategoryModel(
    name: "메인3",
    subCategoryList: [
      SubCategory(
        name: "서브3.1",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      )
    ]
  ),
  CategoryModel(
    name: "메인4",
    subCategoryList: [
      SubCategory(
        name: "서브4.1",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브4.2",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브4.3",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브4.4",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브4.5",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      )
    ]
  ),
  CategoryModel(
    name: "메인5",
    subCategoryList: [
      SubCategory(
        name: "서브5.1",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브5.2",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      ),
      SubCategory(
        name: "서브5.3",
        colors: UIColor.getRandomColorList().map { ColorModel(name: "컬러(\($0.hexString))", color: $0) }
      )
    ]
  )
]

extension UIColor {
  static var randomColor: UIColor {
    UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
  }
  
  static func getRandomColorList() -> [UIColor] {
    (0...((10...30).randomElement() ?? 10))
      .map { _ in Self.randomColor }
  }
  
  var hexString: String {
    let components = self.cgColor.components
    let r = components?[0] ?? 0.0
    let g = components?[1] ?? 0.0
    let b = components?[2] ?? 0.0
    return String(
      format: "#%02lX%02lX%02lX",
      lroundf(Float(r * 255)),
      lroundf(Float(g * 255)),
      lroundf(Float(b * 255))
    )
  }
}
