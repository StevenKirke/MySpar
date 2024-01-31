//
//  ReviewCard.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 View описывающая карточку отзыва.
 - Включает в себя структуры:
		- GradeElement: Заголовок и общее количество отзывов.
		- ImageGrade: Изображение для визуализации рейтинга.
 - Элементы UI:
		- Text - Фамилия, имя.
		- Text - Дата отзыва.
		- Text - Текст отзыва.
 - Parameters:
		- grade: Int Количество оценок .
		- width: Ширина карточки.
		- precent: Высота карточки, вычисляемое свойство, необходимо указать процентное 		соотношение.
 - Attention: Элементы Text заполнены произвольными данными, не подключены к модели.
 */
struct ReviewCard: View {

	@State var grade: Int = 4

	private let width: CGFloat = 260
	private var precent: CGFloat {
		let precent: CGFloat = 60
		return (precent * width) / 100
	}

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Александр В.")
				.addFoundCera(size: 16, weight: .bold, type: .regular)
			Text("7 мая 2021")
			GradeElement(grade: grade)
			Text("Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
				.lineLimit(3)
		}
		.frame(width: width, height: precent)
		.padding(10)
		.background(Color.white)
		.mask(
			RoundedRectangle(cornerRadius: 15)
		)
		.shadow(color: .black.opacity(0.2), radius: 4)
		.padding(.vertical, 5)
		.padding(.horizontal, 5)
	}
}

/**
 View рейтинга.
 - Включает в себя структуры:
		- ImageGrade: Изображение для блока рейтинга.
 - Parameters:
		- grade: Int Количество оценок .
 - Attention: Количество "Звездочек" - 5.
 */
private struct GradeElement: View {

	let grade: Int

	var body: some View {
		HStack(spacing: 5) {
			ForEach(1...5, id: \.self) { element in
				let currentColor = element <= grade ? Color.yellow : Color.gray
				ImageGrade(currentColor: currentColor)
			}
		}
	}
}

/**
 View изображение для рейтинга.
 - Parameters:
		- imageStar: UIImage изображение для визуализации рейтинга.
		- currentColor: Color Цвет изображения.
 */
private struct ImageGrade: View {

	private let imageStar = UIImage(named: "Images/MockImages/StarComplex")
	let currentColor: Color

	var body: some View {
		if let currentImage = imageStar {
			Image(uiImage: currentImage)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(currentColor)
				.frame(width: 20, height: 20)
		}
	}
}

#if DEBUG
struct ReviewCard_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
