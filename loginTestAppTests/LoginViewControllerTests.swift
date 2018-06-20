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
		
		// call this to instantiate the view controller's root view
		let _ = loginVC.view
		
		XCTAssertTrue(loginVC.errorMessageLabel.isHidden)
    }
    
}
