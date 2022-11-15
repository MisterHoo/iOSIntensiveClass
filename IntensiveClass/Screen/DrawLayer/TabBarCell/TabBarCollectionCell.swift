//
//  TabBarCollectionCell.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 14/11/22.
//

import UIKit

class TabBarCollectionCell: UICollectionViewCell {

	@IBOutlet weak var tabNameLabel: UILabel!
	@IBOutlet weak var indicatorView: UIView!
	
	var isTabSelected: Bool = false {
		didSet {
			indicatorView.isHidden = !isSelected
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
		indicatorView.isHidden = true
		drawTriangle()
    }
	
	private func drawTriangle() {
		let size = indicatorView.frame.size
		
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: size.height))
		path.addLine(to: CGPoint(x: size.width / 2 , y: 0))
		path.addLine(to: CGPoint(x: size.width, y: size.height))
		path.close()
		
		let layer = CAShapeLayer()
		layer.path = path.cgPath
		layer.fillColor = UIColor.white.cgColor
		layer.frame = indicatorView.bounds
		indicatorView.layer.addSublayer(layer)
	}

}
