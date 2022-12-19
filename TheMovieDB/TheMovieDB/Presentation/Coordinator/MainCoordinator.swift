//
//  MainCoordinator.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 12/10/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, MovieDetailProtocol {
    // MARK: - Properties
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Screens
    func start() {
        guard let vc = SplashScreenViewController.instantiate() else {
            return
        }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finishSplashScreen() {
        guard let vc = MainViewController.instantiate() else {
            return
        }
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: true)
        navigationController.navigationBar.topItem?.title = "Movie DB"
    }
    
    func goToDetail(movieId: Int) {
        let viewModel = DetailViewModel(movieID: String(movieId))
        guard let vc = DetailViewController.instantiate() else {
            fatalError("Unable to create an DetailsViewController instance")
            return
        }
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToSearchMovieScreen() {
        let viewModel = SearchViewModel()
        guard let vc = SearchViewController.instantiate() else {
            fatalError("Unable to create an SearchViewController instance")
            return
        }
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func getProfileCoordinator() -> ProfileCoordinator {
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.delegate = self
        profileCoordinator.start()
        childCoordinator.append(profileCoordinator)
        return profileCoordinator
    }
}
