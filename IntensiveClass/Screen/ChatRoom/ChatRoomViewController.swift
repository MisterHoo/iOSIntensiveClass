//
//  ChatRoomViewController.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 19/09/22.
//

import UIKit

class ChatRoomViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()

        // Do any additional setup after loading the view.
    }
	
	private func setupTableView() {
//		self.tableView.register(UINib.init(nibName: "tableview", bundle: nil), forCellReuseIdentifier: "r")
//		tableView.delegate = self
//		tableView.dataSource = self
		tableView.tableFooterView = UIView()
//
//		tableView.estimatedRowHeight = 600
	}
	
	
	


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
