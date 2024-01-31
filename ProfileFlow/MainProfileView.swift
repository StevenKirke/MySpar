//
//  MainProfileView.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import SwiftUI

/**
 View Начальный экран, потока ProfileFlow.
 */
struct MainProfileView: View {
	var body: some View {
		Text("Profile view")
			.frame(maxWidth: .infinity, maxHeight: .infinity)
	}
}

#if DEBUG
struct MainProfileView_Previews: PreviewProvider {
	static var previews: some View {
		MainProfileView()
	}
}
#endif
