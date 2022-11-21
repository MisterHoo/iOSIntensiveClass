//
//  HeaderSectionAdapter.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 21/11/22.
//

import Foundation
import UIKit

class HeaderSectionAdapter: TableSectionAdapter {
	
	var identifier: String = "HeaderSectionAdapter"
	
	var backgroundColor: UIColor = .white
	
	var onDidSelectIndex: ((Int) -> Void)?
	var onNeedReload: ((TableSectionAdapter) -> Void)?
	
	func numberOfRows(_ tableView: UITableView) -> Int {
		return 3
	}
	
	func cellForRow(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		var contentConfig = cell.defaultContentConfiguration()
		contentConfig.text = "Header \(indexPath.row)"
		cell.contentConfiguration = contentConfig
		cell.backgroundColor = backgroundColor
		return cell
	}
	
	func viewForHeader(_ tableView: UITableView) -> UIView? {
		let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: tableView.frame.width, height: 100)))
		
		view.backgroundColor = .red
		
		return view
	}
	
	func heightForHeader(_ tableView: UITableView) -> CGFloat {
		return CGFloat(100.0)
	}
	
	func didSelect(_ tableView: UITableView, indexPath: IndexPath) {
		onNeedReload?(self)
	}
	
}
