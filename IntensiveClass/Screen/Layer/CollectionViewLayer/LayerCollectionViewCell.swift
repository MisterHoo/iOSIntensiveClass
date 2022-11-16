//
//  LayerCollectionViewCell.swift
//  IntensiveClass
//
//  Created by Maulana Dimas Iffandi on 09/11/22.
//

import UIKit

class LayerCollectionViewCell: UICollectionViewCell {
		
	let trianglePath = UIBezierPath()
	let triangleLayer = CAShapeLayer()

	@IBOutlet weak var view: UIView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		drawTriangle()
    }
	
	func drawTriangle() {
		let viewSize = view.frame.size
		trianglePath.move(to: CGPoint(x: 0, y: viewSize.width/2 - 10))
		trianglePath.addLine(to: CGPoint(x: viewSize.width/2 - 10, y: 0))
		trianglePath.addLine(to: CGPoint(x: viewSize.width/2 + 10, y: viewSize.height))
		trianglePath.close()
		triangleLayer.path = trianglePath.cgPath
		triangleLayer.fillColor = UIColor.white.cgColor
//		triangleLayer.anchorPoint = .zero
		view.layer.addSublayer(triangleLayer)
	}
}
