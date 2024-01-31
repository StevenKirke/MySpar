//
//  SceneDelegate.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {

		let contentView = ContentView()

		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			window.rootViewController = UIHostingController(rootView: contentView)

			self.window = window
			window.makeKeyAndVisible()
		}
	}
}
