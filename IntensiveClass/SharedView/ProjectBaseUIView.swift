//
//  ProjectBaseUIView.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 30/08/22.
//

import Foundation
import UIKit

@IBDesignable class ProjectBaseUIView: UIView {
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
	
	private func setupBorder() {
		self.layer.cornerRadius = cornerRadius
		self.layer.borderWidth = borderWidth
		self.layer.borderColor = borderColor.cgColor
	}
}
