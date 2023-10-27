//
//  LastOnboardingPresenter.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol LastOnboardingPresenter: AnyObject {
    func injectView(with view: LastOnboardingViewProtocol)
    
    func viewDidLoad()
    func tuppedButton()
    func tuppedTransitionTitle()
}

final class LastOnboardingPresenterImpl {
    // MARK: - Private Properties
    
    private weak var view: LastOnboardingViewProtocol?

    // MARK: - Init
    
    init() {}
    
    // MARK: - Public Methods

    func injectView(with view: LastOnboardingViewProtocol) {
        if self.view == nil { self.view = view }
    }
    
    // MARK: - Private Methods

    private func configureNewModule() -> UIViewController {
        let presenter = MainPresenterImpl()
        let view = MainViewController(presenter: presenter)
        presenter.injectView(with: view)
        view.modalTransitionStyle = .crossDissolve
        view.modalPresentationStyle = .fullScreen
        
        return view
    }
}

    // MARK: - LastOnboardingPresenter

extension LastOnboardingPresenterImpl: LastOnboardingPresenter {
    func viewDidLoad() {
        view?.updateContent(
            OnboardingModel.getLastOnboarding(),
            signature: Localizable.Message.signature)
    }
    
    func tuppedButton() {
        view?.transition(to: configureNewModule(), animated: true)
    }
    
    func tuppedTransitionTitle() {
        print("tupped title")
    }
}
