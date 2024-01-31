//
//  ICoordinator.swift
//  MySpar
//
//  Created by Steven Kirke on 30.01.2024.
//

import Foundation

protocol ICoordinator: AnyObject {
	func start()
}

final class  BaseCoordinator: ICoordinator {

	// MARK: - Public properties
	var childCoordinators: [ICoordinator] = []

	// MARK: - Private methods
	func start() { }

	func addDependency(_ coordinator: ICoordinator) {
		guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
		childCoordinators.append(coordinator)
	}

	func removeDependency(_ coordinator: ICoordinator) {
		guard !childCoordinators.isEmpty else { return }

		if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
			coordinator.childCoordinators.forEach { coordinator.removeDependency($0) }
		}

		if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
			childCoordinators.remove(at: index)
		}
	}

}
