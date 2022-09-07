//
//  PhotoCollectionTableCellTableViewCell.swift
//  IntensiveClass
//
//  Created by Maulana Dimas Iffandi on 05/09/22.
//

import UIKit

class PhotoCollectionTableCellTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var descriptionTitle: UILabel!
	@IBOutlet weak var username: UILabel!
	@IBOutlet weak var labelPhoto: UILabel!
	@IBOutlet weak var imageAvatar: UIImageView!
	
	let label = 1
	
	@IBOutlet weak var collectionPhoto: UICollectionView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
		collectionPhoto.register(nib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
		collectionPhoto.dataSource = self
		collectionPhoto.delegate = self
		collectionPhoto.contentInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 7
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionPhoto.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
		
		var number = label + indexPath.row
		
		cell.labelCollection.text = String(number)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: 100)
	}
    
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 100
	}
}
