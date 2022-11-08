//
//  DrawLayerViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 07/11/22.
//

import UIKit

class DrawLayerViewController: UIViewController {

	
	@IBOutlet weak var mainView: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		drawTriangleIn(view: mainView)
    }

	private func drawTriangleIn(view: UIView) {
		let viewSize = view.frame.size
		
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: viewSize.height))
		path.addQuadCurve(to: CGPoint(x: viewSize.width, y: viewSize.height), controlPoint: CGPoint(x: viewSize.width / 2, y: 0))
		path.addLine(to: CGPoint(x: 0, y: viewSize.height))
		path.close()
		
		let layer = CAShapeLayer()
		layer.path = path.cgPath
		layer.fillColor = UIColor.blue.cgColor
		layer.frame = CGRect(origin: .zero, size: viewSize)
		
		view.layer.addSublayer(layer)
	}
}
