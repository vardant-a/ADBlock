//
//  SceneDelegate.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = buildOnboarding()
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

extension SceneDelegate {
    func buildOnboarding() -> UIViewController {
        let presenter: OnboardingPresenter = OnboardingPresenterImpl(type: .first)
        let view = OnboardingViewController(presenter: presenter)
        presenter.injectView(with: view)
        
        return view
    }
}
