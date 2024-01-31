//
//  Units.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

/// Перечисление, описывающие единицы товара.
enum Units: Int, CaseIterable {
	/// Килограмм
	case kilogram
	/// Штука
	case thing

	/// Название.
	var title: String {
		var title: String = ""
		switch self {
		case .kilogram:
			title = "Кг"
		case .thing:
			title = "Шт"
		}
		return title
	}
}
