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
            //popularViewController()
            setUpTabs()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 6, green: 34, blue: 68, alpha: 1)
    }
    
    func setUpTabs() {
        let popularItem = UITabBarItem(title: "Popular", image: .init(systemName: "popcorn.fill"), tag: 3)
        let popularVC = PopularViewController()
        popularVC.tabBarItem = popularItem
        viewControllers?.append(popularVC)
        
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
    
    func popularViewController() {
        let popularItem = UITabBarItem(title: "Popular", image: .init(systemName: "popcorn.fill"), tag: 3)
        tabBarItem = popularItem
        let popularVC = PopularViewController()
        popularVC.view.backgroundColor = .white
        popularVC.tabBarItem = popularItem
        viewControllers?.append(popularVC)
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
