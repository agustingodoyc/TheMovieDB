//
//  MainCoordinator.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 12/10/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
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
    }
    
    func goToDetail(movieId: Int) { //Agregar protocolo
        let viewModel = DetailsViewModel(movieID: String(movieId))
        guard let vc = DetailsViewController.instantiate() else {
            print(fatalError("Unable to create an DetailsViewController instance"))
            return
        }
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
