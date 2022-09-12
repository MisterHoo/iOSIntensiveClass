//
//  ChatRoomViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 12/09/22.
//

import UIKit

class ChatRoomViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var placeholderLabel: UILabel!
	@IBOutlet weak var sendButton: UIButton!
	@IBOutlet weak var chatTextView: UITextView!
	
	@IBOutlet weak var constHeightTextView: NSLayoutConstraint!
	@IBOutlet weak var constBottomStackView: NSLayoutConstraint!
	
	private let cellIdentifier = "ChatRoomTableCell"
	
	var chats: [String] = [] {
		didSet {
			tableView.reloadData()
		}
	}
	
	@IBAction func didTapSend(_ sender: Any) {
		guard let chat = chatTextView.text,
			  !chat.isEmpty else {
				  return
			  }
		
		chats.append(chat)
		chatTextView.text = ""
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
		setupTableView()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		chats.removeAll()
		setupNavigationBar()
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
		self.constBottomStackView.constant = keyboardFrame.height - safeAreaInset.bottom
	}
	
	@objc private func hideKeyboard(_ notification: Notification) {
		self.constBottomStackView.constant = 0
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		guard keyPath == #keyPath(UITextView.contentSize),
			  let contentSize = change?[NSKeyValueChangeKey.newKey] as? CGSize,
			  let objectTextView = object as? UITextView,
			  objectTextView == chatTextView else {
			return
		}
		
		var height = contentSize.height
		let paddingVertical: CGFloat = 16
		let maxLines: CGFloat = 4
		let maxHeight = (20 * maxLines) + paddingVertical
		height = max(32, height)
		height = min(maxHeight, height)
		
		constHeightTextView.constant = height
	}
	
	private func setupNavigationBar() {
		title = "Chat Room"
		let color = UIColor(red: 45.0/255.0, green: 57.0/255.0, blue: 56.0/255.0, alpha: 1.0)
		navigationController?.navigationBar.barTintColor = color
		navigationController?.navigationBar.backgroundColor = color
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
	}
	
	private func setupView() {
		chatTextView.layer.cornerRadius = 4
		chatTextView.delegate = self
		chatTextView.autocorrectionType = .no
		chatTextView.autocapitalizationType = .none
		chatTextView.tintColor = .white
		
		chatTextView.addObserver(self, forKeyPath: #keyPath(UITextView.contentSize), options: [NSKeyValueObservingOptions.new], context: nil)
	}
	
	private func setupTableView() {
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.separatorStyle = .none
		tableView.keyboardDismissMode = .onDrag
		tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
	}

}

extension ChatRoomViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ChatRoomTableCell else {
			return UITableViewCell()
		}
		
		cell.chatLabel.text = chats[indexPath.row]
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return chats.count
	}
}

extension ChatRoomViewController: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		guard textView.text == "" else {
			return
		}
		
		placeholderLabel.isHidden = true
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		placeholderLabel.isHidden = textView.text != ""
	}
}

