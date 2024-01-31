//
//  TabBarView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 Tab Bar.
 - Включает в себя структуры:
		- HeaderTabBar: Элемент отображающийся в карточке товара.
 - Parameters:
		- item: TabBarPage Элементы Tab Bar.
		- isBackMenu: Bool Переключение.
 */
struct TabBarView: View {

	@Binding var item: TabBarPage
	@Binding var isItemMenu: Bool

	var body: some View {
		VStack(spacing: 16) {
			if item == .main {
				withAnimation(.linear) {
					HeaderTabBar()
						.transition(.move(edge: .bottom))
				}
			}
			HStack(spacing: 0) {
				ForEach(TabBarPage.allCases, id: \.self) { item in
					Button(action: {
						DispatchQueue.main.async {
							withAnimation(.easeInOut) {
								self.item = item
								self.isItemMenu.toggle()
							}
						}
					}, label: {
						VStack(spacing: 0) {
							Image(item.image)
								.resizable()
								.scaledToFit()
								.frame(width: 24)
							Text(item.title)
								.addFoundCera(size: 11, weight: .regular, type: .bold)
						}
					})
					.foregroundColor(self.item == item ? Color(hex: "#15B742") : Color(hex: "#515151"))
					.frame(maxWidth: .infinity)
				}
			}
			.padding(.top, 10)
			.padding(.bottom, 20)
			.background(Color.white)
		}
		.background(
			Color.white
				.shadow(color: .black.opacity(0.4), radius: 10, y: 5)
		)
	}
}

#if DEBUG
struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView(item: .constant(.main), isItemMenu: .constant(false))
	}
}
#endif
