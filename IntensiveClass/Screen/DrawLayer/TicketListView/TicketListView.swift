//
//  TicketListView.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 15/11/22.
//

import UIKit

class TicketListView: UIView {
	
	@IBOutlet weak var tableView: UITableView!
	
	private let cellIdentifier = "TicketListTableCell"
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		loadNib()
		setupTableView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		loadNib()
		setupTableView()
	}
	
	private func loadNib() {
		guard let view = loadViewFromNib(nibName: "TicketListView") else {
			return
		}
		view.frame = bounds
		addSubview(view)
	}
	
	private func setupTableView() {
		tableView.dataSource = self
		tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
		tableView.separatorStyle = .none
		tableView.showsVerticalScrollIndicator = false
	}

}

extension TicketListView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TicketListTableCell else {
			return UITableViewCell()
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
}
