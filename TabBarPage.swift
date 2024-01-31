//
//  TabBarPage.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

enum TabBarPage: Int, CaseIterable {
	case main
	case catalog
	case basket
	case profile

	var selectPage: Int {
		guard let currentIndex = TabBarPage.allTabBarPage.firstIndex(of: self) else { return .zero}
		return currentIndex
	}

	var title: String {
		var title = ""
		switch self {
		case .main:
			title = "Главная"
		case .catalog:
			title = "Каталог"
		case .basket:
			title = "Корзина"
		case .profile:
			title = "Профиль"
		}
		return title
	}

	var image: String {
		var image = ""
		switch self {
		case .main:
			image = "Images/TabBar/MainIcon"
		case .catalog:
			image = "Images/TabBar/CatalogIcon"
		case .basket:
			image = "Images/TabBar/BasketIcon"
		case .profile:
			image = "Images/TabBar/ProfileIcon"
		}
		return image
	}

	static let allTabBarPage: [TabBarPage] = [.main, .catalog, .basket, .profile]
	static let firstPage: TabBarPage = .main
}
