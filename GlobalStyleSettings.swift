//
//  GlobalStyleSettings.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

typealias Styles = GlobalStyleSettings

/// Стили для UI элементов
/// Note: Настройки радиусов, размеров шрифтов, отступов, прозрачности, длительности анимацтт.
enum GlobalStyleSettings {
	/// Настройки радиусов.
	enum Radius {
		/// 1
		static let radiusOne: CGFloat = 1
		/// 7
		static let radiusTextField: CGFloat = 7
	}

	/// Настройки ширины границы.
	enum Border {
		/// 1
		static let one: CGFloat = 1
	}

	/// Настройки отступов
	enum Padding {
		/// 0
		static let zero: CGFloat = 0
		/// 5
		static let little: CGFloat = 5
		/// 10
		static let small: CGFloat = 10
		/// 20
		static let average: CGFloat = 20
		/// 30
		static let big: CGFloat = 30
		/// 32
		static let bigLittle: CGFloat = 32
		/// 40
		static let bigger: CGFloat = 40
	}
}
