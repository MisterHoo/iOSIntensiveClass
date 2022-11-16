//
//  LayerViewController.swift
//  IntensiveClass
//
//  Created by Maulana Dimas Iffandi on 09/11/22.
//

import UIKit

class LayerViewController: UIViewController {
	
	@IBOutlet weak var layerCollectionViewCell: UICollectionView!
	
	@IBOutlet weak var bezierView: UIView!
	
	@IBOutlet weak var cardView: UIView!
	
	let cellIdentifier = "LayerCollectionViewCell"
	
	var isHide = true
	
	var selectedIndex = 0
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		setupCollectionView()
		
//		drawSegitigaLancip()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		setupCardView()
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	private func setupCollectionView() {
		layerCollectionViewCell.dataSource = self
		layerCollectionViewCell.delegate = self
		layerCollectionViewCell.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
		layerCollectionViewCell.showsHorizontalScrollIndicator = false
		layerCollectionViewCell.reloadData()
	}
	
	private func setupCardView() {
		drawBuletBuletTiket()
	}
	
	private func drawBuletBuletTiket() {
		let setengahBuletShapeLayer = CAShapeLayer()
		setengahBuletShapeLayer.frame = cardView.bounds
//		setengahBuletShapeLayer.fillColor = UIColor.red.cgColor
		
		let ticketShapePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: setengahBuletShapeLayer.frame.width, height: setengahBuletShapeLayer.frame.height), cornerRadius: 18)
		
		let topLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: setengahBuletShapeLayer.frame.height/2),
										  radius: 36 / 2,
										  startAngle:  CGFloat(Double.pi / 2),
										  endAngle: CGFloat(Double.pi + Double.pi / 2),
										  clockwise: false)
		topLeftArcPath.close()
		
		let topRightArcPath = UIBezierPath(arcCenter: CGPoint(x: setengahBuletShapeLayer.frame.width, y: setengahBuletShapeLayer.frame.height/2),
										   radius: 36 / 2,
										   startAngle:  CGFloat(Double.pi / 2),
										   endAngle: CGFloat(Double.pi + Double.pi / 2),
										   clockwise: true)
		topRightArcPath.close()
		
		ticketShapePath.append(topLeftArcPath)
		ticketShapePath.append(topRightArcPath.reversing())
		
		setengahBuletShapeLayer.path = ticketShapePath.cgPath
		
		
		let imageLayer = CAShapeLayer()
		let image = UIImage(named: "tiniwinibiti")?.cgImage
		
		
		imageLayer.contents = image
		imageLayer.frame = cardView.bounds

		imageLayer.mask = setengahBuletShapeLayer
		
		cardView.layer.addSublayer(imageLayer)
	}
}

extension LayerViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? LayerCollectionViewCell else {
			return UICollectionViewCell()
		}
				
		cell.triangleLayer.isHidden = true
		
		if selectedIndex == indexPath.item {
			cell.triangleLayer.isHidden = false
		}
		
		return cell
	}
	
}

extension LayerViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: layerCollectionViewCell.frame.width/3, height: layerCollectionViewCell.frame.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let cell = collectionView.cellForItem(at: indexPath) as! LayerCollectionViewCell
		
		selectedIndex = indexPath.item
		
		collectionView.reloadData()
		
//		if isHide == true {
//			cell.triangleLayer.isHidden = false
//			isHide = false
//		} else {
//			cell.triangleLayer.isHidden = true
//			isHide = true
//		}
				
		print("Hide = \(isHide)")
		print("Pencet \(indexPath.item)")
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}

