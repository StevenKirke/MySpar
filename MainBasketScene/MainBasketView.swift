//
//  MainBasketView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 View Начальный экран, потока BasketFlow.
 */
struct MainBasketView: View {
	var body: some View {
		Text("Basket view")
			.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

#if DEBUG
struct MainBasketView_Previews: PreviewProvider {
	static var previews: some View {
		MainBasketView()
	}
}
#endif
