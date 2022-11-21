//
//  ContentSectionAdapter.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 21/11/22.
//

import Foundation
import UIKit

class ContentSectionAdapter: TableSectionAdapter {
	var identifier: String = "HeaderSectionAdapter"
	var onNeedReload: ((TableSectionAdapter) -> Void)?
	
	private let cellIdentifier = "ContentSectionAdapterCell"
	
	func registerCell(_ tableView: UITableView) {
		tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
	}
	
	func numberOfRows(_ tableView: UITableView) -> Int {
		return 10
	}
	
	func cellForRow(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContentSectionAdapterCell else {
			return UITableViewCell()
		}
		
		cell.text = "Content \(indexPath.row + 1)"
		
		return cell
	}
	
}
