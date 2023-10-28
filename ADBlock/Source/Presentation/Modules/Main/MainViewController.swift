//
//  MainViewController.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func updateContent(title: String)
}

final class MainViewController: UIViewController {
    // MARK: - Private Properties

    private let presenter: MainPresenter
    
    private let titleLabel: UILabel = {
        $0.textColor = ColorSet.white
        $0.font = UIFont.systemFont(
            ofSize: LocalConstants.titleFont,
            weight: .bold)
        $0.numberOfLines = LocalConstants.numberOfLines
        return $0
    }(UILabel())
    
    private let collectionLayout: UICollectionViewFlowLayout = .init()
    
    // MARK: - Private lazy Properties
    
    private lazy var propertyCollectionView: UICollectionView = {
        collectionLayout.scrollDirection = .vertical
        $0.register(
            PropertyCell.self,
            forCellWithReuseIdentifier: PropertyCell.identifier)
        $0.backgroundColor = .clear
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: collectionLayout))

    private lazy var termsOfServiceLabel = TransitionTitleButton(
        self, title: Localizable.Message.termsOfService, accentColor: ColorSet.accent,
        action: #selector(tuppedTransitionLabel))

    // MARK: - Init

    init(presenter: MainPresenter) {
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
        view.addSubviews(
            titleLabel, propertyCollectionView, termsOfServiceLabel)
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayout()
    }
    
    // MARK: - @Objc Methods
    
    @objc private func tuppedTransitionLabel() {
        presenter.tuppedTransitionTitle()
    }
    
    // MARK: - Layout

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.verticalOffset * 1.5),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.horizontalOffset),
            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.horizontalOffset),
            
            propertyCollectionView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.verticalOffset),
            propertyCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            propertyCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            propertyCollectionView.bottomAnchor.constraint(
                equalTo: termsOfServiceLabel.topAnchor,
                constant: -Constants.verticalOffset),
            
            termsOfServiceLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            termsOfServiceLabel.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constants.verticalOffset / 2)
        ])
    }
    
    // MARK: - LocalConstants
    
    private enum LocalConstants {
        static let cellCount = 3
        static let cellHeight: CGFloat = 139
        static let titleFont: CGFloat = 24
        static let numberOfLines = 0
    }
}

    // MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LocalConstants.cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PropertyCell.identifier,
                for: indexPath) as? PropertyCell else { return UICollectionViewCell() }
        let cellModel = presenter.propertyCellContent[indexPath.item]
        cell.configure(model: cellModel)
        
        return cell
    }
}

    // MARK: UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: propertyCollectionView.frame.width - Constants.horizontalOffset * 2,
            height: LocalConstants.cellHeight)
    }
}

    // MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = SelectedCell(rawValue: indexPath.item) else { return }
        presenter.tuppedCell(selectedCell)
    }
}

    // MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func updateContent(title: String) {
        titleLabel.text = title
    }
}
