//
//  ContentSectionAdapterCell.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 21/11/22.
//

import UIKit

class ContentSectionAdapterCell: UITableViewCell {
	
	@IBOutlet weak var contentLabel: UILabel!
	
	var text: String = "" {
		didSet {
			contentLabel.text = text
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
