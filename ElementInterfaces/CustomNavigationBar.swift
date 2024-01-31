//
//  CustomNavigationBar.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 Navigation bar для блока "Главная"
 - Включает в себя структуры:
		- ButtonForNavigationBar: Кнопка.
 - Warning: Параметры action не активны.
 */
struct CustomNavigationBar: View {
	var body: some View {
		HStack(spacing: 0) {
			ButtonForNavigationBar(image: "arrow.left", action: {})
			Spacer()
			HStack(spacing: 16) {
				ButtonForNavigationBar(image: "list.bullet.rectangle.portrait", action: {})
				ButtonForNavigationBar(image: "square.and.arrow.up", action: {})
				ButtonForNavigationBar(image: "heart", action: {})
			}
		}
		.padding(.bottom, 10)
		.padding(.horizontal)
		.overlay(
			Rectangle()
				.frame(width: nil, height: 1, alignment: .bottom)
				.foregroundColor(Color.black), alignment: .bottom)
	}
}

/**
 Кнопка для Navigation bar.
 - Parameters:
		- image: String Имя изображения.
		- action: Действие на кнопку.
 */
private struct ButtonForNavigationBar: View {

	let image: String
	var action: () -> Void

	var body: some View {
		Button(action: action) {
			Image(systemName: image)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 18, height: 18)
				.font(Font.title.weight(.semibold))
		}
		.foregroundColor(Color(hex: "#25BD4F"))
		.padding(.top, 10)
	}
}

#if DEBUG
struct CustomNavigationBar_Previews: PreviewProvider {
	static var previews: some View {
		CustomNavigationBar()
	}
}
#endif
