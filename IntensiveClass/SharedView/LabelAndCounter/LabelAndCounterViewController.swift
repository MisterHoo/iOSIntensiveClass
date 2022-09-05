//
//  LabelAndCounterViewController.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 30/08/22.
//

import UIKit

@IBDesignable class LabelAndCounterViewController: UIView {
	
	@IBOutlet weak var leftLabel: UILabel!
	@IBOutlet weak var rightLabel: UILabel!
	
	var leftValue: String = "" {
		didSet {
			leftLabel.text = leftValue
		}
	}
	
	var rightValue: String = "" {
		didSet {
			rightLabel.text = rightValue
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat = 4 {
		didSet {
			setupBorder()
		}
	}
	
	@IBInspectable var borderColor: UIColor = .black {
		didSet {
			setupBorder()
		}
	}
	
	@IBInspectable var borderWidth: CGFloat = 1 {
		didSet {
			setupBorder()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		loadNib()
		setupBorder()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		loadNib()
		setupBorder()
	}
	
	private func loadNib() {
		guard let view = loadViewFromNib(nibName: "LabelAndCounterViewController") else {
			return
		}
		view.frame = bounds
		addSubview(view)
	}
	
	private func setupBorder() {
		self.layer.cornerRadius = cornerRadius
		self.layer.borderWidth = borderWidth
		self.layer.borderColor = borderColor.cgColor
	}
}
