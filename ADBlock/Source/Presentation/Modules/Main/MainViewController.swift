//
//  MainViewController.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func updateContent()
}

final class MainViewController: UIViewController {
    // MARK: - Private Properties

    private let presenter: MainPresenter

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
        view.backgroundColor = .red
        presenter.viewDidLoad()
    }
}

    // MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func updateContent() {
    }
}
