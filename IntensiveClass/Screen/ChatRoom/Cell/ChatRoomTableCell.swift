//
//  ChatRoomTableCell.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 12/09/22.
//

import UIKit

class ChatRoomTableCell: UITableViewCell {

	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var chatLabel: UILabel!
	@IBOutlet weak var containerView: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		avatarImageView.layer.cornerRadius = 16
		containerView.layer.cornerRadius = 22
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
