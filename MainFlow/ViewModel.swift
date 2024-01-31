//
//  ViewModel.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

typealias DescModel = MainModel.ViewModel.DescriptionModel
typealias CharacteristicModel = MainModel.ViewModel.Characteristic

// swiftlint:disable nesting
enum MainModel {
	enum Responce {

	}

	enum Request {

	}

	enum ViewModel {
		case success(DescriptionModel)

		struct DescriptionModel {
			var description: String
			var mainCharacteristics: [Characteristic]
		}

		struct Characteristic: Hashable {
			let name: String
			let title: String
		}
	}
}
// swiftlint:enable nesting
