//
//  UIView.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 30/08/22.
//

import Foundation
import UIKit

extension UIView {
	func loadViewFromNib(nibName: String) -> UIView? {
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as? UIView
	}
}
