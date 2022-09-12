//
//  TableViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 05/09/22.
//

import UIKit

class ListComponentViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	private let cellIdentifier = "ListCommentTableCell"
	
	private let totalCell: Int = 10
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		title = "UIKit - List Component"
    }
	

	private func setupTableView() {
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
		tableView.separatorStyle = .none
	}

}

extension ListComponentViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return totalCell
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListCommentTableCell else {
			return UITableViewCell()
		}
		
		cell.commentLabel.numberOfLines = indexPath.row == (totalCell - 1) ? 0 : indexPath.row + 1
		
		return cell
	}
}
