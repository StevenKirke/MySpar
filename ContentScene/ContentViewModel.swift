//
//  ContentViewModel.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

final class ContentViewModel: ObservableObject {

	@Published var backInMenu: Bool = false
	@Published var itemMenu: TabBarPage = TabBarPage.main

}
