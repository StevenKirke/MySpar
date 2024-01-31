//
//  DescriptionCardView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 Карточка описания товара и его характеристик.
 - Включает в себя структуры:
		- ``TitleDescription``: Основное описания товара..
		- ``LabelForInfo``: Блок отображающий название и значения характеристики..
		- ``TitleForLabel``: Элемент отображающий название или значения характеристики..
 - Элементы UI:
		- Text - Название "Основные характеристики".
		- Button - Название "Все характеристики".
		- descriptionModel: Модель с характеристиками и описанием товара.
 - Warning: Элементы Text и Button заполнены произвольными данными, не подключены к модели и не активны.
 */
struct DescriptionCardView: View {

	let descriptionModel: DescModel

	var body: some View {
		VStack(alignment: .leading, spacing: 20) {
			TitleDescription(description: descriptionModel.description)
			VStack(alignment: .leading, spacing: 20) {
				Text("Основные характеристики")
					.fontWeight(.bold)
					.font(.system(size: 16))
				ForEach(descriptionModel.mainCharacteristics, id: \.self) { element in
					LabelForInfo(title: element.name, text: element.title)
				}
			}
			Button(action: {},
				   label: {
				Text("Все характеристики")
					.fontWeight(.bold)
					.font(.system(size: 16))
					.foregroundColor(Color(hex: "#25BD4F"))
			})
		}
	}
}

/**
 View Основное описания товара.
 - Parameters:
		- description: String Название блока.
		- title: String Описание товара.
 - Warning: Элементы Text заполнены произвольными данными, не подключены к модели.
 */
private struct TitleDescription: View {

	let title: String = "Описание"
	let description: String

	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text(title)
				.fontWeight(.bold)
				.font(.system(size: 16))
			Text(description)
				.fontWeight(.semibold)
				.font(.system(size: 16))
		}
	}
}

/**
 Блок отображающий название и значения характеристики.
 - Включает в себя структуры:
		- ``TitleForLabel``: Элемент отображающий название или значения характеристики..
 - Parameters:
		- title: String Название характеристики.
		- text: String Значение характеристики.
 */
private struct LabelForInfo: View {

	let title: String
	let text: String

	var body: some View {
		ZStack(alignment: Alignment(horizontal: .center, vertical: .firstTextBaseline)) {
			Line()
				.stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
				.frame(height: 1)
			HStack(alignment: .top, spacing: 0) {
				TitleForLabel(title: title, alignment: .leading)
				Spacer()
				TitleForLabel(title: text, alignment: .trailing)
			}
		}
	}
}

/**
 Элемент отображающий название или значения характеристики.
 - Parameters:
		- title: String Название или значения характеристики.
		- alignment: Направление выравнивания фрейма.
		- textAlignment: Направление выравнивания текста, вычисляемое свойство.
 */
private struct TitleForLabel: View {

	let title: String
	var alignment: Alignment
	private var textAlignment: TextAlignment {
		calculateAlignment()
	}

	private let width: CGFloat = UIScreen.main.bounds.width
	@State private var widthTitle: CGFloat = 0

	var body: some View {
		ZStack(alignment: alignment) {
			Rectangle()
				.fill(Color.white)
				.frame(width: widthTitle, height: 10)
			Text(title)
				.fontWeight(.semibold)
				.font(.system(size: 14))
				.fixedSize(horizontal: false, vertical: true)
				.clipped()
				.multilineTextAlignment(textAlignment)
				.foregroundColor(.black)
				.frame(maxWidth: width / 2, alignment: alignment)
		}
		.onAppear {
			calculateWidth()
		}
	}

	/**
	 Метод вычисления ширины маски для текста.
	 */
	private func calculateWidth() {
		self.widthTitle = title.widthOfText(currentFont: .systemFont(ofSize: 14, weight: .bold))
		if self.widthTitle >= width / 2 {
			self.widthTitle = width / 2
		}
	}

	/**
	 Метод вычисления направления выравнивания.
	 - Returns: Возвращает направления выравнивания текста.
	 */
	private func calculateAlignment() -> TextAlignment {
		var directional: TextAlignment = .center
		switch alignment {
		case .leading:
			directional = .leading
		case .trailing:
			directional = .trailing
		default:
			break
		}
		return directional
	}
}

struct Line: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: 2, y: 0))
		path.addLine(to: CGPoint(x: rect.width, y: 0))
		return path
	}
}

#if DEBUG
struct DescriptionCardView_Previews: PreviewProvider {
	static var previews: some View {
		let model = MainViewModel()
		DescriptionCardView(descriptionModel: model.description)
	}
}
#endif
