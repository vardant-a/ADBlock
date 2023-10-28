//
//  PropertyCell.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

final class PropertyCell: UICollectionViewCell {
    // MARK: - Public Properties

    static let identifier = "PropertyCell"
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: LocalConstants.animationDuration) { [weak self] in
                guard let self = self else { return }
                self.alpha = self.isHighlighted
                ? LocalConstants.lowAlpha
                : LocalConstants.standardAlpha
                self.transform = self.isHighlighted
                ? CGAffineTransform(scaleX: LocalConstants.scale,
                                    y: LocalConstants.scale)
                : .identity
            }
        }
    }
    
    // MARK: - Private Properties
    
    private var titleCellLabel: UILabel = {
        $0.font = UIFont.systemFont(
            ofSize: LocalConstants.titleFont,
            weight: .bold)
        $0.textColor = ColorSet.white
        return $0
    }(UILabel())
    
    private var messageCellLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: LocalConstants.messageFont)
        $0.textColor = ColorSet.white
        return $0
    }(UILabel())

    private var doneImageView: UIImageView = {
        $0.image = ImageSet.Cell.done
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private var statusImageView: UIImageView = {
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(
            doneImageView, statusImageView, titleCellLabel, messageCellLabel)
        layer.cornerRadius = LocalConstants.cornerRadius
        clipsToBounds = true
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    func configure(model: PropertyCellModel) {
        titleCellLabel.text = model.title
        messageCellLabel.text = model.message
        statusImageView.image = model.image
        addVerticalGradientLayer(
            topColor: model.topColor,
            bottomColor: model.bottomColor)
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            doneImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: LocalConstants.lowOffset),
            doneImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: LocalConstants.lowOffset),
            doneImageView.heightAnchor.constraint(
                equalToConstant: LocalConstants.lowImageSize),
            doneImageView.widthAnchor.constraint(
                equalToConstant: LocalConstants.lowImageSize),
            
            titleCellLabel.topAnchor.constraint(
                equalTo: doneImageView.bottomAnchor),
            titleCellLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.horizontalOffset),
            
            messageCellLabel.topAnchor.constraint(
                equalTo: titleCellLabel.bottomAnchor,
                constant: LocalConstants.lowOffset),
            messageCellLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.horizontalOffset),
            
            statusImageView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor),
            statusImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            statusImageView.heightAnchor.constraint(
                equalToConstant: LocalConstants.bigImageSize),
            statusImageView.widthAnchor.constraint(
                equalToConstant: LocalConstants.bigImageSize)
        ])
    }
    
    // MARK: - LocalConstants

    private enum LocalConstants {
        static let titleFont: CGFloat = 18
        static let messageFont: CGFloat = 14
        static let lowOffset: CGFloat = 12
        static let cornerRadius: CGFloat = 34
        static let lowImageSize: CGFloat = 56
        static let bigImageSize: CGFloat = 138
        
        static let lowAlpha: CGFloat = 0.7
        static let standardAlpha: CGFloat = 1
        static let scale: CGFloat = 0.95
        static let animationDuration: CGFloat = 0.5
    }
}
