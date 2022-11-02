//
//  MainViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 18/10/2022.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 6, green: 34, blue: 68, alpha: 1)
    }
}

extension MainViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
