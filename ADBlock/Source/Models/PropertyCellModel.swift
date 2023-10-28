//
//  PropertyCellModel.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

struct PropertyCellModel {
    let title: String
    let message: String
    let image: UIImage?
    let topColor: UIColor
    let bottomColor: UIColor
    
    static func getCellModels() -> [PropertyCellModel] {
        return [
        PropertyCellModel(
            title: Localizable.Cell.firstTitle,
            message: Localizable.Cell.firstMessage,
            image: ImageSet.Cell.first,
            topColor: ColorSet.firstCellTop,
            bottomColor: ColorSet.firstCellBottom),
        PropertyCellModel(
            title: Localizable.Cell.secondTitle,
            message: Localizable.Cell.secondMessage,
            image: ImageSet.Cell.second,
            topColor: ColorSet.secondCellTop,
            bottomColor: ColorSet.secondCellBottom),
        PropertyCellModel(
            title: Localizable.Cell.thirdTitle,
            message: Localizable.Cell.thirdMessage,
            image: ImageSet.Cell.third,
            topColor: ColorSet.thirdCellTop,
            bottomColor: ColorSet.thirdCellBottom)
        ]
    }
}
