//
//  MainViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 18/10/2022.
//

import Foundation
import UIKit

class MainViewController: UITabBarController, BaseViewController {
    @IBAction func searchAction(_ sender: Any) {
        coordinator?.goToSearchMovieScreen()
    }
    
    weak var coordinator: MainCoordinator? {
        didSet {
            setUpTabs()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(red: 0.14, green: 0.76, blue: 0.76, alpha: 1)
    }
    
    func setUpTabs() {
        let popularItem = UITabBarItem(title: "Popular", image: .init(systemName: "popcorn.fill"), tag: 3)
        let popularVC = PopularViewController()
        popularVC.tabBarItem = popularItem
        viewControllers?.append(popularVC)
        
        let loginItem = UITabBarItem(title: "Profile", image: .init(systemName: "person.fill"), tag: 4)
        guard let profileCoordinator = coordinator?.getProfileCoordinator() else {
            return
        }
        let navigation = profileCoordinator.navigationController
        navigation.tabBarItem = loginItem
        viewControllers?.append(navigation)
        guard let viewControllers = viewControllers else {
            return
        }
        
        for viewController in viewControllers {
            guard let childViewController = viewController as? BaseViewController else {
                continue
            }
            childViewController.coordinator = self.coordinator
        }
    }
}

// MARK: - Storyboarded
extension MainViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
