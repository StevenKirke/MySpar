//
//  ButtonReviewView.swift
//  MySpar
//
//  Created by Steven Kirke on 31.01.2024.
//

import SwiftUI

/**
 View описывающая блок отзывов.
 - Включает в себя структуры:
		- HeaderScrollReviewsBlock: Заголовок и общее количество отзывов.
		- ReviewCard: Карточка отзыва.
		- ButtonReviewView: Кнопка "Оставить отзыв".
 - Parameters:
		- title: String Название блока.
		- content: Content Карточка отзывов.
 - Attention: По умолчанию отображается 6 карточек.
 */
struct ScrollReviewsBlock<Content: View>: View {

	let title: String = "Отзывы"
	var content: () -> Content

	var body: some View {
		VStack(spacing: 16) {
			HeaderScrollReviewsBlock(title: title)
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(0..<6, id: \.self) { _ in
						ReviewCard()
					}
				}
			}
			ButtonReviewView(action: {})
		}
	}
}

/**
 Структура, заголовок блока "Отзывы".
 - Parameters:
		- title: String Название блока.
		- countReviews: Int Общее количество отзывов.
 - Attention: Параметры оставлены по умолчанию.
 - Warning: Элементы Text заполнены произвольными данными, не подключены к модели.
 */
private struct HeaderScrollReviewsBlock: View {

	let title: String
	let countReviews: Int = 152

	var body: some View {
		HStack {
			Text(title)
				.addFoundCera(size: 20, weight: .bold, type: .regular)
			Spacer()
			Text("Все \(countReviews)")
				.addFoundCera(size: 18, weight: .bold, type: .regular)
				.foregroundColor(Color(hex: "#15B742"))
		}
		.frame(width: .infinity)
	}
}
/**
Кнопка "Оставить отзыв".
 - Элементы UI:
		- Text - "Оставить отзыв".
 - Parameters:
	- action: () -> Void. Действие при нажатии на кнопку.
 - Attention: Параметр action не используется.
 - Warning: Элементы Text заполнены произвольными данными, не подключены к модели.
 */
private struct ButtonReviewView: View {

	var action: () -> Void

	var body: some View {
		Button(action: action) {
			Text("Оставить отзыв")
				.addFoundCera(size: 18, weight: .bold, type: .regular)
				.frame(maxWidth: .infinity)
		}
		.foregroundColor(Color(hex: "#15B742"))
		.padding(.vertical, 10)
		.overlay(
			RoundedRectangle(cornerRadius: 25)
				.stroke(Color(hex: "#15B742"), lineWidth: 3)
		)
		.cornerRadius(25)
	}
}
