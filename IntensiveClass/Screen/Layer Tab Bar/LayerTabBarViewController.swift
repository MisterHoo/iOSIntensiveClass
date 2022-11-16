//
//  LayerTabBarViewController.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 08/11/22.
//

import UIKit

class LayerTabBarViewController: UIViewController {
	
	@IBOutlet weak var tabBarCollectionView: UICollectionView!
	
	@IBOutlet weak var voucherContainer: UIView!
	let cellIdentifier = "TabBarCollectionViewCell"
	
	private var lastIndexPath: IndexPath?
	
	private let cellHeight = 100.0
	private let cellWidth = UIScreen.main.bounds.width / 3
	
	override func viewDidAppear(_ animated: Bool) {
		setupVoucherContainer()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupCollectionView()
    }
	
	private func setupCollectionView() {
		tabBarCollectionView.dataSource = self
		tabBarCollectionView.delegate = self
		tabBarCollectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
		tabBarCollectionView.showsHorizontalScrollIndicator = false
		
	}

}

extension LayerTabBarViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: cellWidth, height: cellHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}

extension LayerTabBarViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TabBarCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		if let lastIndexPath = self.lastIndexPath, lastIndexPath != indexPath {
			let lastCell = collectionView.cellForItem(at: lastIndexPath) as! TabBarCollectionViewCell
			lastCell.isHideTriangle = true
		}
		
		let cell = collectionView.cellForItem(at: indexPath) as! TabBarCollectionViewCell
		cell.isHideTriangle = false
		
		lastIndexPath = indexPath
		
	}
	
}

extension LayerTabBarViewController {
	private func setupVoucherContainer() {
		voucherContainer.layer.cornerRadius = 18
		//bikin shape layer sebesar voucher container
		let ticketShapeLayer = CAShapeLayer()
		ticketShapeLayer.frame = voucherContainer.bounds
		
		//bikin garis berbentuk kotak (path) sebesar ticketShapeLayer dan cornerRadius yang sama
		let ticketShapePath = UIBezierPath(roundedRect: ticketShapeLayer.bounds, cornerRadius: 18)
		
		//bikin setengah lingkaran di kiri yang di gambarnya di tengah2 container
		let leftHalfCircle = UIBezierPath(arcCenter: CGPoint(x: 0, y: voucherContainer.frame.height / 2),
										  radius: 36 / 2,
										  startAngle:  .pi / 2,
										  endAngle: (3 * .pi) / 2,
										  clockwise: false)
		leftHalfCircle.close()
		
		let rightHalfCircle = UIBezierPath(arcCenter: CGPoint(x: voucherContainer.frame.width, y: voucherContainer.frame.height / 2),
										  radius: 36 / 2,
										  startAngle:  (3 * .pi) / 2,
										  endAngle:  .pi / 2,
										  clockwise: false)

		rightHalfCircle.close()
		
		ticketShapePath.append(leftHalfCircle)
		ticketShapePath.append(rightHalfCircle)
		ticketShapeLayer.path = ticketShapePath.cgPath
		
		let myImage = UIImage(named: "banner.jpeg")?.cgImage
		let imageLayer = CAShapeLayer()
		imageLayer.contents = myImage
		imageLayer.contentsGravity = .resizeAspectFill
		imageLayer.frame = voucherContainer.bounds
		
		voucherContainer.layer.mask = ticketShapeLayer
		
		voucherContainer.layer.addSublayer(imageLayer)
	}
}

