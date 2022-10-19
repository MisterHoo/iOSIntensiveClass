//
//  InputFormViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 28/09/22.
//

import UIKit

class InputFormViewController: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var stackView: UIStackView!
	
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var phoneNumberTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var dobTextField: UITextField!
	
	@IBOutlet weak var passwordErrorLabel: UILabel!
	@IBOutlet weak var emailCounterLabel: UILabel!
	
	@IBOutlet weak var passwordVisibilityButton: UIButton!
	let datePicker = UIDatePicker()
	
	@IBAction func didTapRegister(_ sender: Any) {
		let controller = OTPPageViewController()
		self.navigationController?.pushViewController(controller, animated: true)
	}
	
	@IBAction func showPassword(_ sender: Any) {
		passwordTextField.isSecureTextEntry = false
		passwordVisibilityButton.setTitle("Release to Hide", for: .normal)
	}
	
	@IBAction func hidePassword(_ sender: Any) {
		passwordTextField.isSecureTextEntry = true
		passwordVisibilityButton.setTitle("Show Password", for: .normal)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		usernameTextField.delegate = self
		passwordTextField.delegate = self
		phoneNumberTextField.delegate = self
		emailTextField.delegate = self
		scrollView.keyboardDismissMode = .onDrag
		dobTextField.delegate = self
		
		datePicker.maximumDate = Date()
		datePicker.datePickerMode = .date
		datePicker.preferredDatePickerStyle = .wheels
		datePicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
		
		dobTextField.inputView = datePicker
		
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
		toolbar.setItems([flexibleSpace, doneButton], animated: false)
		
		dobTextField.inputAccessoryView = toolbar
		
		passwordTextField.textContentType = .oneTimeCode
		
		passwordErrorLabel.isHidden = true
		
    }
	
	@objc private func dateDidChange() {
		dobTextField.text = formatDate(date: datePicker.date)
	}
	
	@objc private func didTapDone() {
		self.view.endEditing(true)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	@objc private func showKeyboard(_ notification: Notification) {
		guard let userInfo = notification.userInfo,
			  let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
			return
		}
		self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
	}
	
	@objc private func hideKeyboard(_ notification: Notification) {
		self.scrollView.contentInset = .zero
	}
	
	func formatPhoneNumber(text: String) -> String {
		let removedFormat = text.replacingOccurrences(of: "-", with: "").reversed()
		
		guard let textDouble = Double(String(removedFormat)) else {
			return ""
		}
		
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.groupingSeparator = "-"
		formatter.groupingSize = 4
		formatter.secondaryGroupingSize = 3
			
		return String((formatter.string(from: NSNumber(value: textDouble)) ?? "").reversed())
	}
	
	func formatDate(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"
		return dateFormatter.string(from: date)
	}
	// "yyyy-MM-dd'T'HH:mm:ssZ"
	// "2022-12-31'T'23:59:59+0700"
	// timestamp Date().timeIntervalSince1970 -> INI TIMESTAMP
	// Firebase timestamp / 1000
	// Date(timeIntervalSince1970: FirebaseTimeStamp / 1000)
	
	func validatePassword(password: String) -> Bool{
		let passwordRegex =
		// At least one capital letter
		#"^(?=.*[A-Z])"# +
		
		// At least one lowercase letter
		#"(?=.*[a-z])"# +
		
		// At least one digit
		#"(?=.*\d)"# +
		
		// At least 8 characters
		#".{8,}$"#
		
		let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
		return passwordPred.evaluate(with: password)
	}
}

extension InputFormViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if textField == usernameTextField {
			passwordTextField.becomeFirstResponder()
		}
		
		return true
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		guard let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
			return true
		}
		
		if textField == usernameTextField {
			return string != " "
		} else if textField == phoneNumberTextField {
			textField.text = formatPhoneNumber(text: currentText)
			return false
		} else if textField == emailTextField {
			guard currentText.count <= 30 else {
				return false
			}
			emailCounterLabel.text = "\(currentText.count)/30"
		}
		
		return true
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		if textField == passwordTextField {
			passwordErrorLabel.isHidden = true
		}
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		if textField == dobTextField {
			dobTextField.text = formatDate(date: datePicker.date)
		} else if textField == passwordTextField {
			let isValidPassword = validatePassword(password: textField.text ?? "")
			passwordErrorLabel.isHidden = isValidPassword
		}
	}
}
