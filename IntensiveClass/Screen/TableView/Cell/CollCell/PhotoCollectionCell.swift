//
//  PhotoCollectionCell.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 05/09/22.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		imageView.layer.cornerRadius = 4
		imageView.backgroundColor = .gray
    }

}
