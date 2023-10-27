//
//  OnboardingViewController.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol OnboardingViewProtocol: AnyObject {
    func updateContent(_ model: OnboardingModel)
    func transition(to view: UIViewController, animated: Bool)
}

final class OnboardingViewController: UIViewController {
    // MARK: - Private Properties

    private let presenter: OnboardingPresenter
    
    private var onboardingImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private var onboardingTitleLabel: UILabel = {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.lineBreakMode = NSLineBreakMode.byWordWrapping
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private var onboardingMessageLabel: UILabel = {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.lineBreakMode = NSLineBreakMode.byWordWrapping
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    // MARK: - Private lazy Properties

    private lazy var nextButton = StandardButton(
        self, title: Localizable.Button.next, accentColor: .white,
        color: ColorSet.accent, action: #selector(tuppedButton))
    
    // MARK: - Init

    init(presenter: OnboardingPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorSet.background
        view.addSubviews(onboardingImageView, onboardingTitleLabel,
                         onboardingMessageLabel, nextButton)
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setupLayout()
    }
    
    // MARK: - @Objc Methods

    @objc private func tuppedButton() {
        presenter.tuppedButton()
    }
    
    // MARK: - Layout

    private func setupLayout() {
        NSLayoutConstraint.activate([
            onboardingImageView.topAnchor.constraint(
                equalTo: view.topAnchor),
            onboardingImageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            onboardingImageView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.55),
            
            onboardingTitleLabel.topAnchor.constraint(
                equalTo: onboardingImageView.bottomAnchor,
                constant: Constants.horizontalOffset),
            onboardingTitleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.horizontalOffset),
            onboardingTitleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.horizontalOffset),
            onboardingTitleLabel.heightAnchor.constraint(
                equalToConstant: 28.64),
            
            onboardingMessageLabel.topAnchor.constraint(
                equalTo: onboardingTitleLabel.bottomAnchor,
                constant: Constants.verticalOffset),
            onboardingMessageLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.horizontalOffset),
            onboardingMessageLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.horizontalOffset),
            
            nextButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, 
                constant: -Constants.verticalOffset / 2)
        ])
    }
}

    // MARK: - OnboardingViewProtocol

extension OnboardingViewController: OnboardingViewProtocol {
    func updateContent(_ model: OnboardingModel) {
        UIView.transition(
            with: onboardingImageView, duration: 1.0, options: .transitionCrossDissolve
        ) { [weak self] in
            guard let self = self else { return }
            onboardingImageView.image = model.image
            onboardingTitleLabel.text = model.title
            onboardingMessageLabel.text = model.message
        }
    }
    
    func transition(to view: UIViewController, animated: Bool) {
        present(view, animated: animated)
    }
}
