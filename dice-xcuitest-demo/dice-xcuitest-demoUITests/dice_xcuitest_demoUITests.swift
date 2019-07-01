//
//  dice_xcuitest_demoUITests.swift
//  dice-xcuitest-demoUITests
//
//  Created by Eugene Berezin on 6/16/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import XCTest

class dice_xcuitest_demoUITests: XCTestCase {
    
    let diceApp = XCUIApplication(bundleIdentifier: "com.dice.Dice")

    override func setUp() {
        
        continueAfterFailure = false
        diceApp.launch()
        
        addUIInterruptionMonitor(withDescription: "System Dialog") {
            (alert) -> Bool in
            alert.buttons["Allow"].tap()
            return true
        }
        diceApp.tap()
    }

    override func tearDown() {
        LoginScreens.signOut()
        
        guard diceApp.tables.buttons["Sign In"].waitForExistence(timeout: 30) else {
            XCTFail("Sign in button is not visible")
            return
        }
        
        XCTAssert( diceApp.tables.buttons["Sign In"].exists, "Sign in button is not visible")
        
    }

    func testLogin() {
        LoginScreens.logIn(email: TestData.email, password: TestData.password, testCase: self)
        
        guard LoginScreens.buttons.profile.waitForExistence(timeout: 30) else {
            XCTFail("User is not logged in. Profile Button is not visisble")
            return
            
        }
        
        XCTAssert(LoginScreens.buttons.profile.exists, "Profile button is not visible")
    }

}
