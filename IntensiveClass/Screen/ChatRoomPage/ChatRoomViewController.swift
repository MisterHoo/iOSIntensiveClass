//
//  ChatRoomViewController.swift
//  IntensiveClass
//
//  Created by Maulana Dimas Iffandi on 13/09/22.
//

import UIKit

class ChatRoomViewController: UIViewController, UITextViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var textView: UITextView!
	
	@IBOutlet weak var bottomView: UIView!
	
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var heightConstraintTextView: NSLayoutConstraint!
	
	let textViewMaxHeight: CGFloat = 70
	
	private var myContext = 0
	
	override func viewDidLoad() {
        super.viewDidLoad()
		title = "Chat Room Page"
		textView.delegate = self
		
//		textView.addObserver(self, forKeyPath: #keyPath(UITextView.contentSize), options: [NSKeyValueObservingOptions.new], context: nil)
//		textView.addObserver(self, forKeyPath: #keyPath(UITextView.contentSize), options: [.new], context: nil)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.addObserver(self, selector: #selector(handleShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	@objc private func handleShowKeyboard(_ notification: Notification) {
		guard let userInfo = notification.userInfo,
			  let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
				  return
			  }
		
		bottomConstraint.constant = keyboardFrame.height
		
	}
	
	@objc private func handleHideKeyboard(_ notification: Notification) {
		bottomConstraint.constant = 0
	}
	
	func textViewDidChange(_ textView: UITextView) {
		heightConstraintTextView.constant = textView.contentSize.height
	}
	
//	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//		return text !=
//	}
	
//	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//		guard keyPath == #keyPath(UITextView.contentSize),
//		let contentSize = change?[NSKeyValueChangeKey.newKey] as? CGSize,
//		let objectTextView = object as? UITextView,
//		objectTextView == textView else {
//			return
//		}
//
//		print(contentSize)
//		var height = contentSize.height
//		height = max(30, height)
//		heightConstraintTextView.constant = height
//		view.setNeedsLayout()
//	}
	
}
