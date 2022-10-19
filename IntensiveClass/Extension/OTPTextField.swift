//
//  OTPTextField.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 18/10/22.
//

import Foundation
import UIKit

protocol OTPTextFieldDelegate {
	func didDeleteBackward(textField: OTPTextField)
}

class OTPTextField: UITextField {
	
	var deleteDelegate: OTPTextFieldDelegate?
	
	override func deleteBackward() {
		super.deleteBackward()
		deleteDelegate?.didDeleteBackward(textField: self)
	}
}
