//
//  MainViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 18/10/2022.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    
    weak var coordinator: MainCoordinator? {
        didSet {
            setUpTabs()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 6, green: 34, blue: 68, alpha: 1)
    }
    
    func setUpTabs() {
        guard let viewControllers = viewControllers else {
            return
        }
        for viewController in viewControllers {
            guard let vc = viewController as? TabBarViewControllerProtocol else {
                return
            }
            /*var vc = viewController as? TabBarViewControllerProtocol*/
            vc.viewModel.coordinator = self.coordinator
        }
    }
}

extension MainViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
