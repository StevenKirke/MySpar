//
//  ExtensionView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

struct SafeAreaInsetsKey: PreferenceKey {
	static var defaultValue = EdgeInsets()
	static func reduce(value: inout EdgeInsets, nextValue: () -> EdgeInsets) {
		value = nextValue()
	}
}

extension View {
	/**
	 Метод вычисления безопасной области.
	 - Parameters:
			- safeInsets: 
	 - Returns: Возвращает View.
	 */
	func getSafeAreaInsets(_ safeInsets: Binding<EdgeInsets>) -> some View {
		background(
			GeometryReader { proxy in
				Color.clear
					.preference(key: SafeAreaInsetsKey.self, value: proxy.safeAreaInsets)
			}
			.onPreferenceChange(SafeAreaInsetsKey.self) { value in
				safeInsets.wrappedValue = value
			}
		)
	}
}
