//
//  OTPPageViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 18/10/22.
//

import UIKit

class OTPPageViewController: UIViewController {

	@IBOutlet weak var firstContainer: UIView!
	@IBOutlet weak var secondContainer: UIView!
	@IBOutlet weak var thirdContainer: UIView!
	@IBOutlet weak var fourthContainer: UIView!
	
	@IBOutlet weak var firstTextField: OTPTextField!
	@IBOutlet weak var secondTextField: OTPTextField!
	@IBOutlet weak var thirdTextField: OTPTextField!
	@IBOutlet weak var fourthTextField: OTPTextField!
	
	@IBOutlet weak var monthTextField: OTPTextField!
	@IBOutlet weak var yearTextField: OTPTextField!
	
	var containers: [UIView] {
		return [
			firstContainer,
			secondContainer,
			thirdContainer,
			fourthContainer
		]
	}
	
	var textFields: [OTPTextField] {
		return [
			firstTextField,
			secondTextField,
			thirdTextField,
			fourthTextField
		]
	}
	
	var ccTextFields: [OTPTextField] {
		return [
			monthTextField,
			yearTextField
		]
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		containers.forEach { view in
			view.layer.cornerRadius = 12
			view.layer.borderWidth = 4
			view.layer.borderColor = UIColor.black.cgColor
		}
		
		for textField in textFields {
			textField.delegate = self
			textField.deleteDelegate = self
			textField.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
			textField.textColor = .blue
			textField.textContentType = .oneTimeCode
			textField.textAlignment = .center
			textField.keyboardType = .asciiCapableNumberPad
			
			
			let toolbar = UIToolbar()
			toolbar.sizeToFit()
			let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
			let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.didTapDone))
			toolbar.setItems([flexibleSpace, doneButton], animated: false)
			
			textField.inputAccessoryView = toolbar
		}
		
		for textField in ccTextFields {
			textField.delegate = self
			textField.deleteDelegate = self
			textField.textColor = .blue
			textField.textAlignment = .center
			textField.keyboardType = .asciiCapableNumberPad
			
			
			let toolbar = UIToolbar()
			toolbar.sizeToFit()
			let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
			let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.didTapDone))
			toolbar.setItems([flexibleSpace, doneButton], animated: false)
			
			textField.inputAccessoryView = toolbar
		}
	}
	
	@objc private func didTapDone() {
		self.view.endEditing(true)
	}
}

extension OTPPageViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		guard let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
			return false
		}
		
		if let otpTextField = textField as? OTPTextField,
		   textFields.contains(otpTextField) {
			guard !currentText.isEmpty else {
				return true
			}
			
			textField.text = currentText
			
			if firstTextField.isFirstResponder {
				secondTextField.becomeFirstResponder()
			} else if secondTextField.isFirstResponder {
				thirdTextField.becomeFirstResponder()
			} else if thirdTextField.isFirstResponder {
				fourthTextField.becomeFirstResponder()
			} else if fourthTextField.isFirstResponder {
				textField.resignFirstResponder()
			}
			
			return false
		} else {
			if monthTextField.isFirstResponder {
				// MONTH
				if monthTextField.text == "" {
					// Check first number
					let allowedAsDecimal = ["0","1"]
					if string == "" {
						return true
					} else if allowedAsDecimal.contains(string) {
						return true
					} else {
						monthTextField.text = "0\(string)"
						yearTextField.becomeFirstResponder()
						return false
					}
				} else {
					if string == "" {
						return true
					} else if monthTextField.text?.count == 2 {
						yearTextField.text = "\(string)"
						yearTextField.becomeFirstResponder()
						return false
					}
					
					
					if monthTextField.text == "0" {
						if string == "0" {
							return false
						}
						monthTextField.text = currentText
						yearTextField.becomeFirstResponder()
						return false
					} else {
						let allowedNumber = ["0", "1", "2"]
						
						if allowedNumber.contains(string) {
							monthTextField.text = currentText
							yearTextField.becomeFirstResponder()
							return false
						}
						return false
					}
				}
			} else {
				yearTextField.text = currentText
				
				if currentText.count == 2 {
					yearTextField.resignFirstResponder()
				}
				
				return false
			}
		}
	}
}

extension OTPPageViewController: OTPTextFieldDelegate {
	func didDeleteBackward(textField: OTPTextField) {
		
		if textFields.contains(textField) {
			textField.text = ""
			
			if fourthTextField.isFirstResponder {
				thirdTextField.becomeFirstResponder()
			} else if thirdTextField.isFirstResponder {
				secondTextField.becomeFirstResponder()
			} else if secondTextField.isFirstResponder {
				firstTextField.becomeFirstResponder()
			}
		} else {
			if textField == yearTextField,
			   textField.text == "" {
				monthTextField.becomeFirstResponder()
			}
		}
	}
}
