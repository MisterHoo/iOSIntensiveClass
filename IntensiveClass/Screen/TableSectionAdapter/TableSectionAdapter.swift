//
//  TableSectionAdapter.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 21/11/22.
//

import Foundation
import UIKit

protocol TableSectionAdapter {
	var identifier: String { get }
	var onNeedReload: ((TableSectionAdapter) -> Void)? { get set }
	
	func registerCell(_ tableView: UITableView)
	func numberOfRows(_ tableView: UITableView) -> Int
	func cellForRow(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
	func didSelect(_ tableView: UITableView, indexPath: IndexPath)
	func viewForHeader(_ tableView: UITableView) -> UIView?
	func viewForFooter(_ tableView: UITableView) -> UIView?
	func heightForHeader(_ tableView: UITableView) -> CGFloat
	func heightForFooter(_ tableView: UITableView) -> CGFloat
}

extension TableSectionAdapter {
	func didSelect(_ tableView: UITableView, indexPath: IndexPath) {
		
	}
	
	func viewForHeader(_ tableView: UITableView) -> UIView? {
		return nil
	}
	
	func viewForFooter(_ tableView: UITableView) -> UIView? {
		return nil
	}
	
	func heightForHeader(_ tableView: UITableView) -> CGFloat {
		return CGFloat.leastNonzeroMagnitude
	}
	
	func heightForFooter(_ tableView: UITableView) -> CGFloat {
		return CGFloat.leastNonzeroMagnitude
	}
	
	func registerCell(_ tableView: UITableView) {
		
	}
}
