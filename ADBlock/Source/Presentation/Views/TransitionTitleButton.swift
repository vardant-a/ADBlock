//
//  TransitionTitleButton.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

final class TransitionTitleButton: UIButton {
    private var accentColor: UIColor
    
    // MARK: - Init
    
    convenience init(
        _ target: Any?, title: String, accentColor: UIColor,
        action: Selector
    ) {
        self.init(frame: .zero)
        self.accentColor = accentColor
        setTitle(title, for: .normal)
        setTitleColor(accentColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        self.accentColor = .black
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setTitleColor(accentColor.withAlphaComponent(0.5), for: .normal)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setTitleColor(accentColor, for: .normal)
    }
}
