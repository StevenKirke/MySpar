//
//  ExtensionString.swift
//  MySpar
//
//  Created by Steven Kirke on 31.01.2024.
//

import SwiftUI

extension String {
	/**
	 Метод вычисления ширины текста.
	 - Parameters:
			- currentFont: Настройки шрифта, размер и насыщенность.
	 - Returns: Возвращает ширину текста.
	 */
	func widthOfText(currentFont: UIFont) -> CGFloat {
		let fontAttribute = [NSAttributedString.Key.font: currentFont]
		let size = self.size(withAttributes: fontAttribute)
		return size.width
	}
}
