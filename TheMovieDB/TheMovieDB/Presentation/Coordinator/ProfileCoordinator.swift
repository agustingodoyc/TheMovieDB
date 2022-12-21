//
//  ProfileCoordinator.swift
//  TheMovieDB
//
//  Created by Angela Lee on 16/12/2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: Coordinator?
    
    init(_ navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    // MARK: - Screens
    func start() {
        if ProfileViewModel().checkStatus() == true {
            let viewModel = ProfileViewModel()
            let vc = ProfileViewController()
            vc.profileCoordinator = self
            vc.viewModel = viewModel
            navigationController.pushViewController(vc, animated: true)
            
        } else {
            let vc = LoginViewController()
            vc.profileCoordinator = self
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func goToLoginScreen() {
        let viewModel = LoginViewModel()
        let vc = LoginViewController()
        vc.profileCoordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToRegisterScreen() {
        let viewModel = RegisterViewModel()
        let vc = RegisterViewController()
        vc.profileCoordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func registerSuccess() {
        navigationController.popViewController(animated: true)
    }
    
    func loginSuccess() {
        let viewModel = ProfileViewModel()
        let vc = ProfileViewController()
        vc.profileCoordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
