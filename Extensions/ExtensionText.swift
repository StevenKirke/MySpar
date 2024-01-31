//
//  ExtensionText.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

enum FontType: String {
	case bold = " CeraRoundPro-Bold"
	case regular = "CeraRoundPro-Regular"
}

extension Text {
	/**
	 Метод добавление кастомного шрифта из Assets.
	 - Parameters:
			- size: Размер шрифта.
			- weight: Насыщенность шрифта.
			- type: Тип начертания шрифта.
	 - Returns: Возвращает View.
	 */
	func addFoundCera(size: CGFloat, weight: Font.Weight, type: FontType) -> some View {
		self
			.font(Font.custom(type.rawValue, size: size))
			.fontWeight(weight)
	}
}
