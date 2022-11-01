//
//  ListClassViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 05/09/22.
//

import UIKit

class ListClassViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	private var classes: [ClassModel] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		generateClassData()
		setupTableView()
		
		title = "List Class"
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.navigationBar.barTintColor = .blue
		navigationController?.navigationBar.backgroundColor = .blue
		navigationController?.navigationBar.titleTextAttributes = [
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
		navigationController?.navigationBar.tintColor = .white
	}
	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
	}
	
	private func generateClassData() {
		classes.append(ClassModel(dateString: "30 August 2022", title: "UIKit Basic", controller: LandingPageViewController()))
		classes.append(ClassModel(dateString: "5 September 2022", title: "UIKit List Component", controller: ListComponentViewController()))
		classes.append(ClassModel(dateString: "12 September 2022", title: "UIKit Chat Room", controller: ChatRoomViewController()))
		classes.append(ClassModel(dateString: "28 September 2022", title: "UIKit Input Form", controller: InputFormViewController()))
		classes.append(ClassModel(dateString: "19 October 2022", title: "Search Bar", controller: SearchBarViewController()))
		classes.append(ClassModel(dateString: "1 November 2022", title: "Table View - Perform Batch Updates", controller: TableBatchUpdatesViewController()))
	}
}

extension ListClassViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let classObject = classes[indexPath.row]
		
		self.navigationController?.pushViewController(classObject.controller, animated: true)
	}
}

extension ListClassViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let classObject = classes[indexPath.row]
		
		var listContent = cell.defaultContentConfiguration()
		listContent.text = "\(classObject.title) - \(classObject.dateString)"
		
		cell.contentConfiguration = listContent
		cell.selectionStyle = .none
		
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return classes.count
	}
}

class ClassModel {
	
	var dateString: String
	var title: String
	var controller: UIViewController
	
	
	internal init(dateString: String, title: String, controller: UIViewController) {
		self.dateString = dateString
		self.title = title
		self.controller = controller
	}
}
