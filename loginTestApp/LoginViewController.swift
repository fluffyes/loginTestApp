//
//  LoginViewController.swift
//  loginTestApp
//
//  Created by Soul on 20/06/2018.
//  Copyright © 2018 Fluffy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	
	@IBOutlet weak var errorMessageLabel: UILabel!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		// Hide error message
		self.errorMessageLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	// MARK: IBAction
	@IBAction func loginTapped(_ sender: Any) {
		guard let username = self.usernameTextField.text, username.count > 0 else {
			errorMessageLabel.text = "Username cannot be empty"
			errorMessageLabel.isHidden = false
			return
		}
		
		guard let password = self.passwordTextField.text,
			password.count > 0 else {
				errorMessageLabel.text = "Password cannot be empty"
				errorMessageLabel.isHidden = false
			return
		}
		
		// login performed successfully
		errorMessageLabel.isHidden = true
		let loginSuccessAlert = UIAlertController(title: "Success", message: "Login successful!", preferredStyle: .alert)
		let okButton = UIAlertAction(title: "Yay", style: .default, handler: nil)
		loginSuccessAlert.addAction(okButton)
		
		self.present(loginSuccessAlert, animated: true, completion: nil)
	}
	
	@IBAction func backgroundTapped(_ sender: Any) {
		// dismiss keyboard for any textfield for current view
		self.view.endEditing(true)
	}
	
}
