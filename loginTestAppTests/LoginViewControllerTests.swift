//
//  LoginViewControllerTests.swift
//  loginTestAppTests
//
//  Created by Soul on 20/06/2018.
//  Copyright © 2018 Fluffy. All rights reserved.
//

import XCTest

// import the 'loginTestApp' (your app) target and its source file so we can use the classes in test
@testable import loginTestApp

class LoginViewControllerTests: XCTestCase {
	
	// this method will be called before every test function is called
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateInitialViewController() as! LoginViewController
		
		// call this so that the view controller's view will be instantiated
		// else its view wont load and we cant access the labels / buttons on it
		let _ = loginVC.view
		
		// Set Login View Controller as the current view on the (imaginary) iOS device
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.makeKeyAndVisible()
		window.rootViewController = loginVC
		_ = loginVC.view
	}
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testErrorMessageShouldBeHiddenAtFirst() {
		let loginVC = UIApplication.shared.keyWindow?.rootViewController as! LoginViewController
		
		// Error message should be hidden when the view controller is first loaded
		XCTAssertTrue(loginVC.errorMessageLabel.isHidden)
    }
	
	func testUsernameErrorShouldShowWhenUsernameIsBlank(){
		let loginVC = UIApplication.shared.keyWindow?.rootViewController as! LoginViewController
		
		// simulate login button tap by calling the IBAction method
		loginVC.loginTapped(loginVC.loginButton)
		
		// Error message should appear and have text 'Username cannot be empty'
		XCTAssertFalse(loginVC.errorMessageLabel.isHidden)
		XCTAssertEqual(loginVC.errorMessageLabel.text, "Username cannot be empty")
	}
	
	func testPasswordErrorShouldShowWhenPasswordIsBlankAndUsernameIsNotBlank(){
		let loginVC = UIApplication.shared.keyWindow?.rootViewController as! LoginViewController
		
		// simulate fill in username text field
		loginVC.usernameTextField.text = "axelkee"
		
		// simulate login button tap by calling the IBAction method
		loginVC.loginTapped(loginVC.loginButton)
		
		// Error message should appear and have text 'Username cannot be empty'
		XCTAssertFalse(loginVC.errorMessageLabel.isHidden)
		XCTAssertEqual(loginVC.errorMessageLabel.text, "Password cannot be empty")
	}
	
	func testAlertShouldAppearWhenLoginIsSuccessful(){
		let loginVC = UIApplication.shared.keyWindow?.rootViewController as! LoginViewController
		
		// simulate fill in username and password
		loginVC.usernameTextField.text = "axelkee"
		loginVC.passwordTextField.text = "supersecretpassword"
		
		// simulate login button tap by calling the IBAction method
		loginVC.loginTapped(loginVC.loginButton)
		
		// Error message should not appear
		XCTAssertTrue(loginVC.errorMessageLabel.isHidden)
		
		// The alert should be presented
		XCTAssertTrue(loginVC.presentedViewController is UIAlertController)
	}
}
