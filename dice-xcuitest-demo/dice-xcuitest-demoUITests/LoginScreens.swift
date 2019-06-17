//
//  LoginScreens.swift
//  dice-xcuitest-demoUITests
//
//  Created by Eugene Berezin on 6/16/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import Foundation
import XCTest

class LoginScreens {
    
    static let diceApp = XCUIApplication(bundleIdentifier: "com.dice.Dice")
    
    struct TextFields {
        let email: XCUIElement
        let password: XCUIElement
    }
    
    struct Buttons {
        let homePageSignIn: XCUIElement
        let signIn: XCUIElement
        let profile: XCUIElement
        let settings: XCUIElement
        let signOut: XCUIElement
        let done: XCUIElement
        
    }
    
    static let textFields = TextFields(email: diceApp.scrollViews.otherElements.textFields["Login_Email"],
                                password: diceApp.scrollViews.otherElements.secureTextFields["Login_Password"])
    
    static let buttons = Buttons(homePageSignIn: diceApp.tables.buttons["Home_Profile_Strength_SignIn_Button"],
                          signIn: diceApp.scrollViews.otherElements.buttons["Sign In"],
                          profile: diceApp.tabBars.buttons["Profile"],
                          settings: diceApp.navigationBars["Profile"].buttons["Settings"],
                          signOut: diceApp.tables.buttons["Settings_Sign_Out_Button"],
                          done: diceApp.navigationBars["Settings"].buttons["Done"])
    static func logIn(email: String, password: String) {
        buttons.homePageSignIn.tap()
        textFields.email.tap()
        textFields.email.typeText(email)
        textFields.password.tap()
        textFields.password.typeText(password)
        buttons.signIn.tap()
    
    }
    
    static func signOut() {
        guard buttons.profile.waitForExistence(timeout: 30) else {
            XCTFail("Profile item is not visible")
            return
        }
        buttons.profile.tap()
        buttons.settings.tap()
        buttons.signOut.tap()
    }
}
