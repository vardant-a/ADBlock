//
//  StandardButton.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

final class StandardButton: UIButton {
    // MARK: - Private Properties
    
    private var accentColor: UIColor

    private var backColor: UIColor
    
    // MARK: Init

    convenience init(
        _ target: Any?, title: String, accentColor: UIColor,
        color: UIColor, action: Selector
    ) {
        self.init(frame: .zero)
        self.accentColor = accentColor
        backColor = color
        configure(target, title: title, action: action)
    }

    override init(frame: CGRect) {
        self.accentColor = ColorSet.black
        self.backColor = .clear
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods

    private func configure(_ target: Any?, title: String, action: Selector) {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(
            ofSize: LocalConstants.customFont,
            weight: .bold)
        setTitleColor(accentColor, for: .normal)
        addTarget(target, action: action, for: .touchUpInside)
        backgroundColor = backColor
    }
    
    // MARK: - Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setTitleColor(accentColor.withAlphaComponent(LocalConstants.alphaComponent), for: .normal)
        backgroundColor = backColor.withAlphaComponent(LocalConstants.alphaComponent)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setTitleColor(accentColor, for: .normal)
        backgroundColor = backColor
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
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
        static let alphaComponent: CGFloat = 0.65
    }
}
