//
//  ListCommentTableCell.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 05/09/22.
//

import UIKit

class ListCommentTableCell: UITableViewCell {

	@IBOutlet weak var shadowView: UIView!
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var avatarView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var commentLabel: UILabel!
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	let cellIdentifier = "PhotoCollectionCell"
	
	override func awakeFromNib() {
        super.awakeFromNib()
		avatarView.layer.cornerRadius = 40
		containerView.layer.cornerRadius = 8
		containerView.layer.borderColor = UIColor.cyan.cgColor
		containerView.layer.borderWidth = 1
		
		shadowView.layer.cornerRadius = 8
		shadowView.layer.shadowColor = UIColor.gray.cgColor
		shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
		shadowView.layer.shadowRadius = 3
		shadowView.layer.shadowOpacity = 0.3
		
		setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	private func setupCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
		collectionView.contentInset = UIEdgeInsets(top: 0, left: 104, bottom: 0, right: 12)
		collectionView.showsHorizontalScrollIndicator = false
	}
    
}

extension ListCommentTableCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PhotoCollectionCell else {
			return UICollectionViewCell()
		}
		
		cell.label.text = "\(indexPath.row + 1)"
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
}

extension ListCommentTableCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 40, height: 40)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 4
	}
}
