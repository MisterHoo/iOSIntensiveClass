//
//  PhotoCollectionViewController.swift
//  IntensiveClass
//
//  Created by Maulana Dimas Iffandi on 05/09/22.
//

import UIKit

class PhotoCollectionViewController: UIViewController {
		
	@IBOutlet weak var tableView: UITableView!
	
	let uname = "Username"
	let descTitle = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	let labelTitle = "Photos :"
	
	let row = 3
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		title = "Photo Collection Page"
		
		let nib = UINib(nibName: "PhotoCollectionTableCellTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "photoCollection")
		tableView.dataSource = self
		tableView.delegate = self
    }
	
}

extension PhotoCollectionViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return row
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "photoCollection", for: indexPath) as! PhotoCollectionTableCellTableViewCell
				
		cell.username.text = uname
		
		cell.descriptionTitle.text = descTitle
		cell.descriptionTitle.numberOfLines = indexPath.row + 1
		
		if indexPath.row == row-1 {
			cell.descriptionTitle.numberOfLines = 0
		}
		
		cell.labelPhoto.text = labelTitle
		cell.imageAvatar.layer.cornerRadius = cell.imageAvatar.frame.size.width / 2
		cell.imageAvatar.image = UIImage(named: "penguin")
		
		
		return cell
	}
	
	
}
