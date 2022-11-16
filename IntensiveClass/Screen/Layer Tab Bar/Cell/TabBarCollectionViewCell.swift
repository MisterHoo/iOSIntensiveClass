//
//  TabBarCollectionViewCell.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 08/11/22.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var containerCell: UIView!
	private var triangleShape: CAShapeLayer!
	
	var isHideTriangle: Bool = false {
		didSet {
			showTriangleShape(isHidden: isHideTriangle)
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
		triangleShape = createTriangle()
		containerCell.layer.addSublayer(triangleShape)
		triangleShape.isHidden = true
    }
	
	private func showTriangleShape(isHidden: Bool) {
		triangleShape.isHidden = isHidden
	}
	
	private func createTriangle() -> CAShapeLayer {
		let cellHeight = 100.0
		let cellWidth = containerCell.bounds.width
		
		let path = UIBezierPath()
		
		let triangleWidth = 20.0
		let triangleHeight = 20.0
		let xStart = (cellWidth / 2) - (triangleWidth)
		path.move(to: CGPoint(x: xStart, y: cellHeight))
		//garis keatas
		path.addLine(to: CGPoint(x: xStart + (triangleWidth / 2), y: cellHeight - triangleHeight))
		//atas ke bawah kanan
		path.addLine(to: CGPoint(x: xStart + (triangleWidth), y: cellHeight))
		//penutup bawah
		path.addLine(to: CGPoint(x: xStart, y: cellHeight))
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.strokeColor = UIColor.white.cgColor
		shapeLayer.fillColor = UIColor.white.cgColor
		shapeLayer.lineWidth = 1

		return shapeLayer
	}

}
