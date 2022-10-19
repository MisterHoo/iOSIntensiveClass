//
//  SearchBarViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 19/10/22.
//

import UIKit

class SearchBarViewController: UIViewController {
	
	var data = ["Tomat", "Jagung", "Bawang", "Jamur", "Bandrek", "Jahe", "Ikan", "Teh"]
	var filteredData: [String] = []
	
	@IBOutlet weak var searchTextField: UITextField!
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		setupTableView()
		setupTextField()
        // Do any additional setup after loading the view.
    }
	
	private func setupTextField() {
		searchTextField.delegate = self
	}
	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	private func filterData(keyword: String) {
		guard !keyword.isEmpty else {
			self.filteredData = []
			tableView.reloadData()
			return
		}
		
		let filtered = data.filter({
			$0.lowercased().hasPrefix(keyword.lowercased())
		})
		
		self.filteredData = filtered
		tableView.reloadData()
	}

}

extension SearchBarViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		searchTextField.text = filteredData[indexPath.row]
		searchTextField.resignFirstResponder()
		filterData(keyword: "")
	}
}

extension SearchBarViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = filteredData[indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredData.count
	}
}

extension SearchBarViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		//currentText = tezt yg ada di textfield + character yg mau di input user
		guard let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
			return true
		}
		
		self.filterData(keyword: currentText)
	
		return true
	}
}

