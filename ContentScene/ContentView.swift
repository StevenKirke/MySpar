//
//  ContentView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 Главный экран.
 - Включает в себя структуры:
		- CurrentView: Отображение главных сцен, основных потоков.
		- TabBarView: Карточка отзыва.
 - Parameters:
		- contentVM: View Model с настройками Tab Bar.
 */
struct ContentView: View {

	@State var safeAreaInsets: EdgeInsets = .init()
	@ObservedObject var contentVM: ContentViewModel = ContentViewModel()

	var body: some View {
		ZStack {
			CurrentView(contentVM: contentVM)
				.padding(.bottom, 200)
			if contentVM.itemMenu == .main {

			}
			TabBarView(item: $contentVM.itemMenu, isItemMenu: $contentVM.backInMenu)
				.frame(maxHeight: .infinity, alignment: .bottom)
		}
		.getSafeAreaInsets($safeAreaInsets)
		.edgesIgnoringSafeArea(.bottom)
	}
}

/**
 Отображение главных сцен, основных потоков.
 - Включает в себя структуры:
		- MainView: Начальный экран, потока MainFlow. Текущая сцена, описывает карточку отзыва.
		- MainCatalogView: Начальный экран, потока CatalogFlow.
		- MainBasketView: Начальный экран, потока BasketFlow.
		- MainProfileView: Начальный экран, потока ProfileFlow.
 - Parameters:
		- contentVM: View Model с настройками Tab Bar.
 */
private struct CurrentView: View {

	@ObservedObject var contentVM: ContentViewModel

	var body: some View {
		VStack(spacing: 0) {
			switch contentVM.itemMenu {
			case .main: MainView()
			case .catalog: MainCatalogView()
			case .basket: MainBasketView()
			case .profile: MainProfileView()
			}
		}
	}
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
