//
//  Onboarding.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

struct OnboardingModel {
    let image: UIImage?
    let title: String
    let message: String

    static func getOnboardings() -> [OnboardingModel] {
        return [
            OnboardingModel(
                image: ImageSet.Onboarding.first,
                title: Localizable.Title.firstOnboard,
                message: Localizable.Message.firstOnboard),
            OnboardingModel(
                image: ImageSet.Onboarding.second,
                title: Localizable.Title.secondOnboard,
                message: Localizable.Message.secondOnboard),
            OnboardingModel(
                image: ImageSet.Onboarding.third,
                title: Localizable.Title.thirdOnboard,
                message: Localizable.Message.thirdOnboard)
        ]
    }

    static func getLastOnboarding() -> OnboardingModel {
        return OnboardingModel(
            image: ImageSet.Onboarding.last,
            title: Localizable.Title.lastOnboard,
            message: Localizable.Message.lastOnboard)
    }
}
