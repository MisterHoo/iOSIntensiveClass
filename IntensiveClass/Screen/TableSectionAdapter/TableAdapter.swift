//
//  TableAdapter.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 21/11/22.
//

import Foundation
import UIKit

class TableAdapter: NSObject {
	
	var onScrolling: ((CGPoint) -> Void)?
	
	var sectionAdapters: [TableSectionAdapter] = [] {
		didSet {
			tableView.reloadData()
		}
	}
	
	private let tableView: UITableView
	
	init(tableView: UITableView) {
		self.tableView = tableView
		super.init()
		setupTableView()
	}
	
	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}

extension TableAdapter: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		return sectionAdapters[indexPath.section].didSelect(tableView, indexPath: indexPath)
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		onScrolling?(scrollView.contentOffset)
	}
}

extension TableAdapter: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return sectionAdapters.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sectionAdapters[section].numberOfRows(tableView)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return sectionAdapters[indexPath.section].cellForRow(tableView, indexPath: indexPath)
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return sectionAdapters[section].viewForHeader(tableView)
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return sectionAdapters[section].viewForFooter(tableView)
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return sectionAdapters[section].heightForHeader(tableView)
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return sectionAdapters[section].heightForFooter(tableView)
	}
}
