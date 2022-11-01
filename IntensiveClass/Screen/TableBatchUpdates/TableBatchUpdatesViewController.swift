//
//  TableBatchUpdatesViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 01/11/22.
//

import UIKit

class TableBatchUpdatesViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet var addView: UIView!
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var indexLabel: UILabel!
	
	private var texts: [String] = ["Kata Pertama", "Kata Kedua", "Kata Ketiga"]
	
	@IBAction func didTapInsert(_ sender: Any) {
		let index = Int(stepper.value)
		let text = textView.text ?? ""
		texts.append(text)
		addView.removeFromSuperview()
		
		tableView.performBatchUpdates { [weak self] in
			let indexPath = IndexPath(row: index, section: 0)
			self?.tableView.insertRows(at: [indexPath], with: .automatic)
		} completion: { _ in
			
		}

	}
	
	@IBAction func didTapCanel(_ sender: UIButton) {
		addView.removeFromSuperview()
	}
	
	@IBAction func didChangeStepper(_ sender: UIStepper) {
		indexLabel.text = String(sender.value)
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		title = "UIKit - Table Batch Updates"
		textView.layer.cornerRadius = 4
		textView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
		textView.layer.borderWidth = 1
		
		addView.layer.cornerRadius = 4
		addView.layer.borderColor = UIColor.blue.cgColor
		addView.layer.borderWidth = 1
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		addButtonBarNavigation()
		tableView.reloadData()
	}
	
	private func setupTableView() {
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.separatorStyle = .singleLine
	}
	
	private func addButtonBarNavigation() {
		let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didAddData))
		self.navigationItem.setRightBarButton(button, animated: true)
	}
	
	@objc private func didAddData() {
		addView.center = view.center
		self.view.addSubview(addView)
		stepper.value = 0
		indexLabel.text = "0"
		textView.text = ""
		stepper.maximumValue = Double(texts.count)
	}

}

extension TableBatchUpdatesViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return texts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()

		var contentConfiguration = cell.defaultContentConfiguration()
		contentConfiguration.text = texts[indexPath.row]
		cell.contentConfiguration = contentConfiguration
		
		return cell
	}
}

