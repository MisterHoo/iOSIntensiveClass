//
//  ListComponentViewController.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 05/09/22.
//

import UIKit

class ListComponentViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	let maxRow = 6
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		title = "Salsa ListView"
		
		// Do any additional setup after loading the view.
	}
	
	private func setupTableView() {
		self.tableView.register(UINib.init(nibName: "ContentComponentTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentComponentTableViewCell")
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		
		tableView.estimatedRowHeight = 600
	}
	

}

extension ListComponentViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentComponentTableViewCell", for: indexPath) as? ContentComponentTableViewCell else { return UITableViewCell() }
		
		cell.imageName = "kayayu.png"
		cell.titleString = "Title \(indexPath.row)"
		
		if indexPath.row == maxRow - 1 {
			cell.descNoOfLine = 0
		} else if indexPath.row == 0 {
			cell.descNoOfLine = 1
		} else {
			cell.descNoOfLine = indexPath.row
		}
		
		cell.descString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis aliquam lacus. Quisque vitae nunc ut est dictum tincidunt at non nunc. Proin venenatis, dui eget mollis vulputate, nibh enim tincidunt odio, nec aliquam eros nisl sagittis mi. Donec dictum orci diam, eget gravida lorem finibus quis. Sed neque nulla, elementum sit amet odio sed, pellentesque malesuada velit. Donec vitae diam eu sem vulputate viverra. Sed erat dui, dictum id sagittis suscipit, consectetur vitae magna. Nam eu quam ante. Phasellus cursus ullamcorper mi, ut hendrerit ipsum auctor sed. Proin sapien risus, semper eu nulla vitae, consectetur feugiat diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam fringilla nec eros nec blandit. Suspendisse potenti. Aenean arcu odio, ullamcorper quis tortor eget, vestibulum blandit nulla. In ultricies cursus auctor. Duis nec lacus dapibus, hendrerit leo nec, volutpat risus. Curabitur in sodales urna. Vivamus volutpat risus in dapibus pulvinar. Sed ornare, elit et faucibus molestie, nibh velit hendrerit dolor, imperdiet ultrices dui nulla eu neque. Pellentesque ut venenatis libero. Quisque rhoncus, elit eu tristique posuere, arcu nunc pellentesque tellus, quis aliquet ipsum elit eu tellus."
		  return cell
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return maxRow
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		  return UITableView.automaticDimension
	  }
}
