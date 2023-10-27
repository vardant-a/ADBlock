//
//  StandardButton.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

final class StandardButton: UIButton {
    // MARK: Init

    convenience init(
        _ target: Any?, title: String, accentColor: UIColor,
        color: UIColor, action: Selector
    ) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(
            ofSize: LocalConstants.customFont,
            weight: .bold)
        setTitleColor(accentColor, for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
        backgroundColor = color
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: LocalConstants.height),
            widthAnchor.constraint(equalToConstant: LocalConstants.width),
        ])
        
        layer.cornerRadius = LocalConstants.cornerRadius
    }
    
    // MARK: - LocalConstants
    
    private enum LocalConstants {
        static let height: CGFloat = 44
        static let width: CGFloat = 285
        static let cornerRadius: CGFloat = 20
        static let customFont: CGFloat = 16
    }
}
