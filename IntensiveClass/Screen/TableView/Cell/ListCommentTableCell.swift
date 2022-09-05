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
		
	}
    
}
