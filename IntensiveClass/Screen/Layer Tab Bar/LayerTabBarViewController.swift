//
//  LayerTabBarViewController.swift
//  IntensiveClass
//
//  Created by Salsabila Azaria on 08/11/22.
//

import UIKit

class LayerTabBarViewController: UIViewController {
	
	@IBOutlet weak var tabBarCollectionView: UICollectionView!
	
	let cellIdentifier = "TabBarCollectionViewCell"
	
	private var lastIndexPath: IndexPath?
	
	private let cellHeight = 100.0
	private let cellWidth = UIScreen.main.bounds.width / 3

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
			lastCell.isShowTriangle = true
		}
		
		let cell = collectionView.cellForItem(at: indexPath) as! TabBarCollectionViewCell
		cell.isShowTriangle = false
		
		lastIndexPath = indexPath
		
	}
	
}

