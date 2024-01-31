//
//  MainCatalogView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 View Начальный экран, потока CatalogFlow.
 */
struct MainCatalogView: View {
	var body: some View {
		Text("Catalog view")
			.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

#if DEBUG
struct MainCatalogView_Previews: PreviewProvider {
	static var previews: some View {
		MainCatalogView()
	}
}
#endif
