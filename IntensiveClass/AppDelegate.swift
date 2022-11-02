//
//  AppDelegate.swift
//  IntensiveClass
//
//  Created by Yosua Antonio Raphael Ekowidjaja on 30/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupInitialScreen()
		
		#if DEBUG
			print("Start Logging")
		#elseif RELEASE
			print("Not Enable Logging")
		#endif
		
		#if DEVELOPMENT
			print("Start Development")
		#elseif STAGING
			print("Start Staging")
		#endif
		
		return true
	}
	
	private func setupInitialScreen() {
		let initialVC = ListClassViewController()
		let navVC = UINavigationController(rootViewController: initialVC)
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = navVC
		window.makeKeyAndVisible()
		
		self.window = window
	}

}

