//
//  LastOnboardingViewController.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol LastOnboardingViewProtocol: AnyObject {
    func updateContent(_ model: OnboardingModel, signature: String)
    func transition(to view: UIViewController, animated: Bool)
}

final class LastOnboardingViewController: UIViewController {
    // MARK: - Private Properties
    
    private let presenter: LastOnboardingPresenter
    
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
    
    private var signatureLabel: UILabel = {
        $0.textColor = .darkGray
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.lineBreakMode = NSLineBreakMode.byWordWrapping
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    

    // MARK: - Private lazy Properties
    
    private lazy var termsOfServiceLabel = TransitionTitleButton(
        self, title: Localizable.Message.termsOfService, accentColor: ColorSet.accent,
        action: #selector(tuppedTransitionLabel))

    private lazy var tryNowButton = StandardButton(
        self, title: Localizable.Button.tryNow, accentColor: .white,
        color: ColorSet.gold, action: #selector(tuppedButton))

    // MARK: - Init

    init(presenter: LastOnboardingPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.addSubviews(
            onboardingImageView, onboardingTitleLabel,
            onboardingMessageLabel, signatureLabel,
            termsOfServiceLabel, tryNowButton)
    }
    
    override func viewDidLayoutSubviews() {
        setupLayout()
    }
    
    // MARK: - @Objc Methods

    @objc private func tuppedButton() {
        presenter.tuppedButton()
    }
    
    @objc private func tuppedTransitionLabel() {
        presenter.tuppedTransitionTitle()
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
                multiplier: LocalConstants.multiplier),
            
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
                equalToConstant: LocalConstants.titleHight),
            
            onboardingMessageLabel.topAnchor.constraint(
                equalTo: onboardingTitleLabel.bottomAnchor,
                constant: Constants.verticalOffset),
            onboardingMessageLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.horizontalOffset),
            onboardingMessageLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.horizontalOffset),
            
            termsOfServiceLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            termsOfServiceLabel.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constants.verticalOffset / 2),
            
            signatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signatureLabel.bottomAnchor.constraint(
                equalTo: termsOfServiceLabel.topAnchor,
                constant: -Constants.verticalOffset / 2),
            signatureLabel.widthAnchor.constraint(
                equalToConstant: LocalConstants.standardWidth),
            signatureLabel.heightAnchor.constraint(
                equalToConstant: LocalConstants.signatureHeight),
            
            tryNowButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            tryNowButton.bottomAnchor.constraint(
                equalTo: signatureLabel.topAnchor,
                constant: -Constants.verticalOffset)
            ])
    }
    
    // MARK: - LocalConstants

    private enum LocalConstants {
        static let standardWidth: CGFloat = 285
        static let signatureHeight: CGFloat = 34
        static let multiplier: CGFloat = 0.55
        static let titleHight: CGFloat = 28.64
    }
}

    // MARK: - LastOnboardingViewProtocol

extension LastOnboardingViewController: LastOnboardingViewProtocol {
    func updateContent(_ model: OnboardingModel, signature: String) {
        view.backgroundColor = ColorSet.background
        onboardingImageView.image = model.image
        onboardingTitleLabel.text = model.title
        onboardingMessageLabel.text = model.message
        signatureLabel.text = signature
    }
    
    func transition(to view: UIViewController, animated: Bool) {
        present(view, animated: animated)
    }
}
