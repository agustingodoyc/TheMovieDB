//
//  DetailsViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation
import UIKit

class DetailsViewController: CheckNetworkConnection {
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailsViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "DetailsScreen", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
