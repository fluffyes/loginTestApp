//
//  LoginViewControllerTests.swift
//  loginTestAppTests
//
//  Created by Soul on 20/06/2018.
//  Copyright © 2018 Fluffy. All rights reserved.
//

import XCTest

// IMPORTANT: import the 'loginTestApp' (your app) target and its source file so we can use the classes in test
@testable import loginTestApp

class LoginViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testErrorMessageShouldBeHiddenAtFirst() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateInitialViewController() as! LoginViewController
		
		// call this so that the view controller's view will be instantiated
		// else its view wont load and we cant access the labels / buttons on it
		let _ = loginVC.view
		
		// Error message should be hidden when the view controller is first loaded
		XCTAssertTrue(loginVC.errorMessageLabel.isHidden)
    }
	
	func testUsernameErrorShouldShowWhenUsernameIsBlank(){
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateInitialViewController() as! LoginViewController
		
		// call this so that the view controller's view will be instantiated
		// else its view wont load and we cant access the labels / buttons on it
		let _ = loginVC.view
		
		// simulate login button tap by calling the IBAction method
		loginVC.loginTapped(loginVC.loginButton)
		
		// Error message should appear and have text 'Username cannot be empty'
		XCTAssertFalse(loginVC.errorMessageLabel.isHidden)
		XCTAssertEqual(loginVC.errorMessageLabel.text, "Username cannot be empty")
	}
}
