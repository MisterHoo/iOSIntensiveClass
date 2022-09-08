//
//  PhotoCollectionViewCell.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 06/09/22.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var photoLabel: UILabel!
	
	var photoString: String = "" {
		didSet {
			photoLabel.text = photoString
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
