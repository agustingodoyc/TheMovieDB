//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 05/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator?

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Storyboard instantiaton

extension ViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
