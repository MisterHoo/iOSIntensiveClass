//
//  TableSectionAdapterViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 21/11/22.
//

import UIKit

class TableSectionAdapterViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	private let headerSectionAdapter = HeaderSectionAdapter()
	private let contentSectionAdapter = ContentSectionAdapter()
	
	private var tableAdapter: TableAdapter?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupSectionAdapters()
		setupTableAdapter()
    }
	
	private func setupTableAdapter() {
		tableAdapter = TableAdapter(tableView: tableView)
		tableAdapter?.sectionAdapters = [
			headerSectionAdapter,
			contentSectionAdapter
		]
	}
	
	private func setupSectionAdapters() {
		setupHeaderSectionAdapter()
		setupContentSectionAdapter()
	}
	
	private func setupHeaderSectionAdapter() {
		headerSectionAdapter.onDidSelectIndex = { [weak self] index in
			print("Tapped Header at \(index)")
		}
		
		headerSectionAdapter.onNeedReload = { [weak self] adapter in
			self?.headerSectionAdapter.backgroundColor = .purple
			self?.reloadAdapter(adapter: adapter)
		}
	}
	
	private func setupContentSectionAdapter() {
		contentSectionAdapter.registerCell(tableView)
		
		contentSectionAdapter.onNeedReload = { [weak self] adapter in
			self?.reloadAdapter(adapter: adapter)
		}
	}
	
	private func reloadAdapter(adapter: TableSectionAdapter) {
		guard let sectionAdapters = tableAdapter?.sectionAdapters,
			  let sectionIndex = sectionAdapters.firstIndex(where: {$0.identifier == adapter.identifier}) else {
			return
		}
		
		let indexSet = IndexSet([sectionIndex])
		DispatchQueue.main.async {
			self.tableView.reloadSections(indexSet, with: .automatic)
		}
	}
}
