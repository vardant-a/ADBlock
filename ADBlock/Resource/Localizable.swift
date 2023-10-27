//
//  Localizable.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import Foundation

enum Localizable {
    enum Title {
        static let firstOnboard = "One more step"
        static let secondOnboard = "No tracking"
        static let thirdOnboard = "No ads"
        static let lastOnboard = "No trace"
    }
    
    enum Message {
        static let firstOnboard = """
                To protect your browsing enable 
                AI Secure extention in Safary
                    1. Open Settings
                    2. Go to Safari/Extension
                    3. Set all Ai toggle
                """
        static let secondOnboard = "3rd party’s sites would not track you anymore"
        static let thirdOnboard = "Ads and popups would not disturb you anymore"
        static let lastOnboard = "No information about adult sites in your history anymore"
        
        static let signature = "Try early option 7 days for free, than 5. No commitment. Cancel anytime."
        static let termsOfService = "Terms of Service & Privacy Policy"
    }
    
    enum Button {
        static let next = "Next"
        static let tryNow = "Try now"
    }
}
