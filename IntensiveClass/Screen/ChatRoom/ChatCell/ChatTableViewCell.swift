//
//  ChatTableViewCell.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 19/09/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
	
	let chatCellIdentifier = "ChatTableViewCell"

	@IBOutlet weak var imageChat: UIImageView!
	@IBOutlet weak var labelChat: UILabel!
	
	var imageChatName: String = "" {
		didSet {
			imageChat.image = UIImage(named: imageChatName)
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
