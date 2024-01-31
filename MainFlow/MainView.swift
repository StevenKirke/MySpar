//
//  MainView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 View Начальный экран, потока MainFlow.
 Текущая сцена, описывает карточку отзыва.
 - Включает в себя структуры:
		- CustomNavigationBar: Navigation bar для блока “Главная”.
		- ProductCardView: Карточка продукта..
		- DescriptionCardView: Карточка описания товара и его характеристик.
		- ScrollReviewsBlock: View описывающая блок отзывов.
 - Parameters:
		- mainViewModel: ViewModel.
 - Attention: MainViewModel содержит в себе только описание товара.
 */
struct MainView: View {

	@ObservedObject var mainViewModel: MainViewModel = MainViewModel()

	var body: some View {
		VStack(spacing: 0) {
			CustomNavigationBar()
			ScrollView(.vertical, showsIndicators: false) {
				VStack(spacing: 40) {
					ProductCardView()
					DescriptionCardView(descriptionModel: mainViewModel.description)
					ScrollReviewsBlock { ReviewCard() }
				}
				.padding(.top, 10)
				.padding(.horizontal, 16)
			}
		}
	}
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
