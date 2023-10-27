//
//  MainPresenter.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol MainPresenter: AnyObject {
    func injectView(with view: MainViewProtocol)
    
    func viewDidLoad()
    func tuppedButton()
}

final class MainPresenterImpl {
    // MARK: - Private Properties
    
    private weak var view: MainViewProtocol?

    // MARK: - Init
    
    init() {}
    
    // MARK: - Public Methods

    func injectView(with view: MainViewProtocol) {
        if self.view == nil { self.view = view }
    }
}

    // MARK: - MainPresenter

extension MainPresenterImpl: MainPresenter {
    func viewDidLoad() {
        view?.updateContent()
    }
    
    func tuppedButton() {
        print("TryNow")
    }
}
