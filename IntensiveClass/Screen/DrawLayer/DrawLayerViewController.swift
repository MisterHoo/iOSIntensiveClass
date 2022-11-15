//
//  DrawLayerViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 07/11/22.
//

import UIKit

class DrawLayerViewController: UIViewController {

	@IBOutlet weak var tabBar: UICollectionView!
	
	private let cellIdentifier: String = "TabBarCollectionCell"
	
	private var tabCount: Int = 4
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupCollectionView()
    }
	
	private func setupCollectionView() {
		tabBar.dataSource = self
		tabBar.delegate = self
		tabBar.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
	}
	
	private func selectTab(_ index: Int) {
		for i in 0..<tabCount {
			guard let cell = tabBar.cellForItem(at: IndexPath(row: i, section: 0)) as? TabBarCollectionCell else {
				continue
			}
			
			cell.isTabSelected = i == index
		}
	}
}

extension DrawLayerViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		selectTab(indexPath.row)
		collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
	}
}

extension DrawLayerViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return tabCount
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TabBarCollectionCell else {
			return UICollectionViewCell()
		}
		
		cell.tabNameLabel.text = "Tab \(indexPath.item + 1)"
		
		return cell
	}
}

extension DrawLayerViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.frame.width * 0.28
		let height = collectionView.frame.height
		
		return CGSize(width: width, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}
