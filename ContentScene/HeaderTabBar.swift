//
//  HeaderTabBar.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI
/**
Элемент отображающийся в карточке товара, и содержит блок отображающий единицы измерения товара и цену.
- Включает в себя структуры:
	   - ``TitleAndButton``: Блок отображающий единицы измерения товара.
- Parameters:
	- price: Double Цена.
	- unit: ``Units`` Единицы измерения.
*/
struct HeaderTabBar: View {

	@State var price: Double = 55.9
	@State var unit: Units = .kilogram

	var body: some View {
		VStack(spacing: 16) {
			VStack {
				Picker("", selection: $unit) {
					ForEach(Units.allCases, id: \.self) { item in
						Text(item.title)
					}
				}
				.pickerStyle(.segmented)
			}
			TitleAndButton(price: $price, unit: $unit, totalPrice: "\(price)")
		}
		.padding(.horizontal, 16)
	}
}

/**
 Блок отображающий единицы измерения товара .
 - Включает в себя структуры:
		- TitlePrice: Блок отображающий цену продукта.
		- AddButton: Кнопка, увеличения или уменьшения единиц товара.
 - Элементы UI:
		- Text - Цена.
		- Text - Старая цена.
		- Text - Стоимость за единицу.
 - Parameters:
		- price: Double Цена.
		- unit: Units Единицы измерения.
		- quantity: Int Количество единиц товара.
		- totalPrice: String Общая сумма за текущий продукт.
 - Warning: Элементы Text заполнены произвольными данными, не подключены к модели.
 */
struct TitleAndButton: View {

	@Binding var price: Double
	@Binding var unit: Units

	@State private var quantity: Int = 1 {
		didSet {
			var total: Double = 0
			switch quantity {
			case ..<0:
				quantity = 0
			case 1:
				total = price
			case 2...:
				total = Double(quantity) * price
			default:
				total = 0
			}
			totalPrice =  String(format: "%.0f", total)
		}
	}

	@State var totalPrice: String = ""

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				TitlePrice(price: "55.9", unit: $unit)
				Text("199.0").strikethrough(color: .black)
					.addFoundCera(size: 16, weight: .bold, type: .regular)
			}
			Spacer()
			HStack(spacing: 0) {
				AddButton(title: "-", action: { quantity -= 1 })
				VStack {
					Text("\(quantity) \(unit.title)")
						.fontWeight(.bold)
					Text("\(totalPrice) ₽")
				}
				.frame(width: 80)
				AddButton(title: "+", action: { quantity += 1 })
			}
			.padding(.horizontal, 10)
			.padding(.vertical, 5)
			.background(Color(hex: "#15B742"))
			.foregroundColor(.white)
			.clipShape(
				RoundedRectangle(cornerRadius: 50)
			)
		}
	}
}

/**
 Блок отображающий цену продукта.
 - Parameters:
		- price: String Цена.
		- unit: Content Единица измерения продукта.
 */
private struct TitlePrice: View {

	let price: String
	@Binding var unit: Units

	var body: some View {
		HStack(spacing: 5) {
			Text(price)
				.addFoundCera(size: 30, weight: .heavy, type: .regular)
			ZStack {
				Text("\u{20BD}")
					.addFoundCera(size: 16, weight: .bold, type: .regular)
					.padding(.bottom, 10)
					.padding(.trailing, 10)
				Text("/")
					.addFoundCera(size: 16, weight: .bold, type: .regular)
					.rotationEffect(.degrees(25))
				Text(unit.title.lowercased())
					.addFoundCera(size: 16, weight: .bold, type: .regular)
					.padding(.trailing, -20)
					.padding(.top, 10)
			}
		}
	}
}

/**
 Кнопка, увеличения или уменьшения единиц товара.
 - Parameters:
		- title: Название кнопки.
		- action: Действие, при нажатие на кнопку.
 */
private struct AddButton: View {
	let title: String
	var action: () -> Void

	var body: some View {
		Button(action: action) {
			Text(title)
				.font(.system(size: 28))
				.fontWeight(.bold)
		}
		.padding(.horizontal, 10)
	}
}

#if DEBUG
struct HeaderTaBBar_Previews: PreviewProvider {
	static var previews: some View {
		HeaderTabBar()
	}
}
#endif
