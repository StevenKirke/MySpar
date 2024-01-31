//
//  ProductCardView.swift
//  MySpar
//
//  Created by Steven Kirke on 31.01.2024.
//

import SwiftUI

/**
 Карточка продукта.
 - Включает в себя структуры:
		- ``ReviewProductCard``: Блок описывающая рейтинг товара и скидку.
		- ``FooterProductCard``: View, отображающая флаг и страну производителя товара.
 - Элементы UI:
		- Text - Название кнопки.
		- Text - Название товара.
 - Parameters:
		- width: CGFloat Ширина экрана.
 - Warning: Элементы Text заполнены произвольными данными, не подключены к модели.
 */

struct ProductCardView: View {

	@State private var width: CGFloat = UIScreen.main.bounds.width

	var body: some View {
		VStack(spacing: 20) {
			Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
				Text("Цена по карте")
			})
			.foregroundColor(.white)
			.padding(.horizontal, 10)
			.padding(.vertical, 7)
			.background(Color(hex: "#25BD4F"))
			.cornerRadius(10)
			.frame(maxWidth: .infinity, alignment: .leading)
			Image("Images/MockImages/Tea")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: width / 2)
			ReviewProductCard()
			HStack(spacing: 0) {
				Text("Добавка \"Липа\" к чаю 200 г")
					.addFoundCera(size: 30, weight: .bold, type: .regular)
					.frame(maxWidth: width / 1.5, alignment: .leading)
				Spacer()
			}
			FooterProductCard()
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

/**
 Блок описывающая рейтинг товара и скидку.
 - Элементы UI:
		- Text - Текущий рейтинг.
		- Text - Количество отзывов.
		- Text - Скидка.
 - Parameters:
		- imageStar: Изображение для визуализации рейтинга.
		- imageSticker: Изображение подложки скидки.
 - Warning: Элементы Text заполнены произвольными данными, не подключены к модели.
 */
private struct ReviewProductCard: View {

	private let imageStar = UIImage(named: "Images/MockImages/StarComplex")
	private let imageSticker = UIImage(named: "Images/MockImages/sticker")

	var body: some View {
		HStack {
			HStack(spacing: 5) {
				if let currentImage = imageStar {
					Image(uiImage: currentImage)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(Color.yellow)
						.frame(width: 24, height: 24)
				}
				Text("4.1")
					.fontWeight(.bold)
					.font(.system(size: 16))
					.foregroundColor(.black)
				RoundedRectangle(cornerRadius: 1)
					.fill(Color.gray)
					.frame(width: 2, height: 18)
				Text("19 Отзывов")
					.fontWeight(.semibold)
					.font(.system(size: 16))
					.foregroundColor(.gray)
			}
			Spacer()
			ZStack {
				if let currentImage = imageSticker {
					Image(uiImage: currentImage)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(Color.red)
						.frame(width: 40, height: 40)
				}
				Text("-5%")
					.foregroundColor(.white)
					.fontWeight(.semibold)
					.font(.system(size: 12))
			}
		}
	}
}

/**
 View, отображающая флаг и страну производителя товара.
 - Элементы UI:
		- Image - Изображение флага государства.
		- Text - Название страны и регион.
 - Warning: Элементы Text и Image заполнены произвольными данными, не подключены к модели.
 */
private struct FooterProductCard: View {
	var body: some View {
		HStack(spacing: 10) {
			Image("Images/MockImages/SpainFlag")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 26, height: 26)
				.mask(
					Circle()
				)
			Text("Испания, Риоха")
				.fontWeight(.semibold)
				.font(.system(size: 12))
				.foregroundColor(.gray)
		}
	}
}

#if DEBUG
struct ProductCardView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
