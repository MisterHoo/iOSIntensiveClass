//
//  TicketListTableCell.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 15/11/22.
//

import UIKit

class TicketListTableCell: UITableViewCell {

	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var badgeView: UIView!
	@IBOutlet weak var bottomView: UIView!
	
	
	private let cornerRadius: CGFloat = 12
	private let horizontalMargin: CGFloat = 16
	private let middlePoint: CGFloat = 60
	private let baseColor: UIColor = UIColor(white: 150.0/255.0, alpha: 0.9)
	
	override func awakeFromNib() {
        super.awakeFromNib()
		setMainMaskingLayer()
		setBadgeLayer()
		setBottomLayer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
	
	private func setMainMaskingLayer() {
		
		let size = CGSize(width: UIScreen.main.bounds.width - ( 2 * horizontalMargin ), height: 200)
		
		let centerY = size.height - middlePoint
		
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: cornerRadius))
		// LEFT SIDE
		path.addLine(to: CGPoint(x: 0, y: centerY - cornerRadius))
		path.addArc(withCenter: CGPoint(x: 0, y: centerY), radius: cornerRadius, startAngle: .pi / 180 * 270, endAngle: .pi / 180 * 90, clockwise: true)
		path.addLine(to: CGPoint(x: 0, y: size.height - cornerRadius))
		path.addArc(withCenter: CGPoint(x: cornerRadius, y: size.height - cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: .pi / 180 * 90, clockwise: false)
		
		// BOTTOM SIDE
		path.addLine(to: CGPoint(x: size.width - cornerRadius, y: size.height))
		path.addArc(withCenter: CGPoint(x: size.width - cornerRadius, y: size.height - cornerRadius), radius: cornerRadius, startAngle: .pi / 180 * 90, endAngle: .pi / 180, clockwise: false)
		
		// RIGHT SIDE
		path.addLine(to: CGPoint(x: size.width, y: centerY + cornerRadius))
		path.addArc(withCenter: CGPoint(x: size.width, y: centerY), radius: cornerRadius, startAngle: .pi / 180 * 90, endAngle: .pi / 180 * 270, clockwise: true)
		path.addLine(to: CGPoint(x: size.width, y: cornerRadius))
		path.addArc(withCenter: CGPoint(x: size.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi / 180, endAngle: .pi / 180 * 270, clockwise: false)
		
		// TOP SIDE
		path.addLine(to: CGPoint(x: cornerRadius, y: 0))
		path.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi / 180 * 270, endAngle: .pi, clockwise: false)
		
		path.close()
		
		let layer = CAShapeLayer()
		layer.path = path.cgPath
		layer.frame = containerView.bounds
		
		containerView.layer.mask = layer
	}
	
	private func setBadgeLayer() {
		let size = badgeView.frame.size
		
		let path = UIBezierPath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: size.width, y: 0))
		path.addLine(to: CGPoint(x: size.width, y: size.height - cornerRadius))
		path.addArc(withCenter: CGPoint(x: size.width - cornerRadius, y: size.height - cornerRadius), radius: cornerRadius, startAngle: .pi / 180, endAngle: .pi / 180 * 90, clockwise: true)
		path.addLine(to: CGPoint(x: 0, y: size.height))
		path.close()
		
		let layer = CAShapeLayer()
		layer.path = path.cgPath
		layer.frame = badgeView.bounds
		layer.fillColor = baseColor.cgColor
		
		badgeView.layer.addSublayer(layer)
	}
	
	private func setBottomLayer() {
		let size = CGSize(width: UIScreen.main.bounds.width - (2 * horizontalMargin), height: 90)
		let centerX = size.width * 0.6
		let horizontalOffset: CGFloat = 20
		
		let path = UIBezierPath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: 0, y: size.height))
		path.addLine(to: CGPoint(x: size.width, y: size.height))
		path.addLine(to: CGPoint(x: size.width, y: size.height - middlePoint))
		path.addLine(to: CGPoint(x: centerX + horizontalOffset, y: size.height - middlePoint))
		path.addQuadCurve(to: CGPoint(x: centerX, y: (size.height - middlePoint) / 2),
						  controlPoint: CGPoint(x: centerX + horizontalOffset * 1 / 4, y: (size.height - middlePoint) / 8 * 7))
		path.addQuadCurve(to: CGPoint(x: centerX - horizontalOffset, y: 0),
						  controlPoint: CGPoint(x: centerX - horizontalOffset * 1 / 4, y: (size.height - middlePoint) / 8 * 1))
		path.close()
		
		let layer = CAShapeLayer()
		layer.path = path.cgPath
		layer.frame = bottomView.bounds
		layer.fillColor = baseColor.cgColor
		
		bottomView.layer.addSublayer(layer)
	}
    
}
