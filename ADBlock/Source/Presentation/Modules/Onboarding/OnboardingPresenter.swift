//
//  OnboardingPresenter.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol OnboardingPresenter: AnyObject {
    func injectView(with view: OnboardingViewProtocol)
    
    func viewDidLoad()
    func tuppedButton()
}

enum OnboardingView {
    case first, second, third
}

final class OnboardingPresenterImpl {
    
    // MARK: - Private Properties

    private weak var view: OnboardingViewProtocol?
    
    private var type: OnboardingView
    
    private let onboardings = OnboardingModel.getOnboardings()
    
    // MARK: - Init
    
    init(type: OnboardingView) {
        self.type = type
    }
    
    // MARK: - Public Methods
    
    func injectView(with view: OnboardingViewProtocol) {
        if self.view == nil { self.view = view }
    }
    
    // MARK: - Private Methods
    
    func configureNextModule() {
        switch type {
        case .first:
            view?.updateContent(onboardings[1])
            type = .second
        case .second:
            view?.updateContent(onboardings[2])
            type = .third
        case .third:
            view?.transition(to: configureMainModule(), animated: true)
        }
    }
    
    func configureMainModule() -> UIViewController {
        let presenter = LastOnboardingPresenterImpl()
        let view = LastOnboardingViewController(presenter: presenter)
        presenter.injectView(with: view)
        view.modalTransitionStyle = .crossDissolve
        view.modalPresentationStyle = .fullScreen
        
        return view
    }
}

    // MARK: - OnboardingPresenter

extension OnboardingPresenterImpl: OnboardingPresenter {
    func viewDidLoad() {
        view?.updateContent(onboardings[0])
    }
    
    func tuppedButton() {
        configureNextModule()
    }
}
