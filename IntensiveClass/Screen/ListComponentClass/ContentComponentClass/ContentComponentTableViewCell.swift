//
//  ContentComponentTableViewCell.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 05/09/22.
//

import UIKit

class ContentComponentTableViewCell: UITableViewCell {
	
	@IBOutlet weak var imageContent: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descLabel: UILabel!
	
	@IBOutlet weak var photoCollectionView: UICollectionView!
	
	var titleString: String = "" {
		didSet {
			titleLabel.text = titleString
		}
	}
	
	var descString: String = "" {
		didSet {
			descLabel.text = descString
		}
	}
	
	var descNoOfLine: Int = 1 {
		didSet {
			descLabel.numberOfLines = descNoOfLine
		}
	}
	
	var imageName: String = "" {
		didSet {
			imageContent.image = UIImage(named: imageName)
		}
	}
	
	override func awakeFromNib() {
		
		super.awakeFromNib()
		setupCollectionView()
	}
	
	private func setupCollectionView() {
		photoCollectionView.showsHorizontalScrollIndicator = false
		photoCollectionView.delegate = self
		photoCollectionView.dataSource = self
//		photoCollectionView.contentInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 0)
		let cellNib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
		self.photoCollectionView.register(cellNib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
	}
	
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	
		// Configure the view for the selected state
	}
	
}

extension ContentComponentTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.photoString = "\(indexPath.row)"
		return cell
	}
	
}


extension ContentComponentTableViewCell: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 50, height: 50)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 4, left: 66, bottom: 4, right: 16)
	}
}
