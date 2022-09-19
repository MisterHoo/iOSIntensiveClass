//
//  ChatRoomViewController.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 19/09/22.
//

import UIKit

class ChatRoomViewController: UIViewController {

	@IBOutlet weak var stackViewBottomConst: NSLayoutConstraint!
	@IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		setupTextView()
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
		let safeAreaInset = UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
		self.stackViewBottomConst.constant = safeAreaInset.bottom - keyboardFrame.height
	}
	
	@objc private func hideKeyboard(_ notification: Notification) {
		self.stackViewBottomConst.constant = 0
	}
	
	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
	}
	
	private func setupTextView() {
		textView.delegate = self
	}

}

extension ChatRoomViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
}

extension ChatRoomViewController: UITextViewDelegate {
	
	func textViewDidChange(_ textView: UITextView) {
		
		var height = textView.contentSize.height
		let maxLines: CGFloat = 4
		let maxHeight = (20 * maxLines) + 8
		height = max(32, height)
		height = min(maxHeight, height)
		
		textViewHeightConstraint.constant = height
	}
	
}


