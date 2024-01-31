//
//  MainViewModel.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

final class MainViewModel: ObservableObject {

	@Published var description: DescModel = DescModel(
		description: """
  Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.
  """,
		mainCharacteristics: [
			CharacteristicModel(name: "Производство", title: "Россия, Краснодарский край"),
			CharacteristicModel(name: "Энергетическая ценность, ккал/100гр", title: "25 ккал, 105 кДж"),
			CharacteristicModel(name: "Жиры/100 г", title: "0,1 г"),
			CharacteristicModel(name: "Белки/100 г", title: "1,3 г"),
			CharacteristicModel(name: "Углеводы/100 г", title: "1,3 г")
		])

}
