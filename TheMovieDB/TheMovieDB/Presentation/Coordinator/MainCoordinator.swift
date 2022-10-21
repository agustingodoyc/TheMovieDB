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
}
